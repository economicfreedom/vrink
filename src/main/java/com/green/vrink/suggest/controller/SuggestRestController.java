package com.green.vrink.suggest.controller;

import com.green.vrink.message.service.MessageService;
import com.green.vrink.suggest.dto.*;
import com.green.vrink.suggest.service.SuggestService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.EditorServiceImpl;
import com.green.vrink.user.service.UserService;
import com.green.vrink.util.AsyncPageDTO;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.Define;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/suggest")
@RequiredArgsConstructor
@Slf4j
public class SuggestRestController {

    private final HttpSession session;
    private final SuggestService suggestService;
    private final EditorServiceImpl editorService;
    private final UserService userService;
    private final MessageService messageService;

    @PostMapping("/post")
    public Integer postSuggest(@RequestBody PostSuggestDto postSuggestDto) {
        User user = (User)session.getAttribute(Define.USER);
        if (user == null) {
            return -1;
        }

        return suggestService.postSuggest(postSuggestDto);
    }
    @PutMapping("/patch")
    public Integer patchSuggest(@RequestBody PatchSuggestDto patchSuggestDto) {
        User user = (User)session.getAttribute(Define.USER);
        if (user == null) {
            return -1;
        }

        return suggestService.patchSuggest(patchSuggestDto);
    }

    @DeleteMapping("/delete/{suggestId}")
    public Integer deleteSuggest(@PathVariable Integer suggestId) {
        User user = (User)session.getAttribute(Define.USER);
        GetSuggestDto suggest = suggestService.getSuggest(suggestId);

        if (user == null || suggest == null || user.getUserId() != suggest.getUserId()) {
            return -1;
        }

        return suggestService.deleteSuggest(suggestId);
    }

    @PostMapping("/reply/post")
    public Integer postSuggestReply(@RequestBody PostSuggestReplyDto postSuggestReplyDto) {
        User user = (User)session.getAttribute(Define.USER);
        if (user == null) {
            return -1;
        }
        Integer editorId = editorService.getEditorIdByUserId(user.getUserId());
        Integer writerId = userService.findUserIdBySuggestId(postSuggestReplyDto.getSuggestId());
        log.info("editorId: {}", editorId);
        log.info("writerId: {}", writerId);
        log.info("session: {}", user.getUserId());
        boolean flag = editorId == null;
        boolean flag2 = writerId.equals(user.getUserId());
        log.info("flag: {}", flag);
        log.info("flag2: {}", flag2);
        if (editorId == null && !writerId.equals(user.getUserId())) {
            return  0;
        }
        return suggestService.postSuggestReply(postSuggestReplyDto);
    }

    @PutMapping("/reply/patch")
    public Integer getReplyCount(@RequestBody PatchSuggestReplyDto patchSuggestReplyDto) {
        User user = (User)session.getAttribute(Define.USER);
        if (user == null) {
            return -1;
        }

        return suggestService.patchSuggestReply(patchSuggestReplyDto);
    }

    @DeleteMapping("/reply/delete/{replyId}")
    public Integer deleteReply(@PathVariable Integer replyId) {
        User user = (User)session.getAttribute(Define.USER);
        if (user == null) {
            return -1;
        }
        return suggestService.deleteSuggestReply(replyId);
    }

    @GetMapping("/more-reply")
    public ResponseEntity<?> more(@RequestParam(name = "suggest-id") Integer suggestId,
                                  @RequestParam(name = "page-num") Integer pageNum) {
        GetSuggestDto suggest = suggestService.getSuggest(suggestId);
        if (suggest == null) {
            return ResponseEntity.notFound().build();
        }

        Criteria cri = new Criteria();
        Integer replyCount = suggestService.getReplyCount(suggestId);
        cri.setPageNum(pageNum);
        cri.setCountPerPage(5);
        List<SuggestReplyDto> replyList = suggestService.getSuggestReplyList(suggestId, cri);

        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(replyCount);
        AsyncPageDTO asyncPageDTO = new AsyncPageDTO();
        asyncPageDTO.setHasNext(pageNum, pageDTO.getEndPage());
        asyncPageDTO.setPageDTOs(replyList);

        return ResponseEntity.ok().body(asyncPageDTO);
    }

    @PutMapping("/accept-suggest/{suggestId}")
    public Integer acceptSuggest(@PathVariable Integer suggestId, @RequestBody AcceptSuggestDto acceptSuggestDto) {
        User user = (User)session.getAttribute(Define.USER);
        if (user == null) {
            return 0;
        }

        int suggestState = suggestService.acceptSuggest(suggestId);
        messageService.sendMessageAndSaveNowPage(acceptSuggestDto.getReceiverId(), acceptSuggestDto.getContent());
        return suggestState;
    }
}
