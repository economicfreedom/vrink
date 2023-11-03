package com.green.vrink.suggest.controller;

import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.suggest.dto.*;
import com.green.vrink.suggest.repository.model.Suggest;
import com.green.vrink.suggest.repository.model.SuggestReply;
import com.green.vrink.suggest.service.SuggestServiceImpl;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.AsyncPageDTO;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.Define;
import com.green.vrink.util.PageDTO;
import com.sun.mail.iap.Response;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/suggest")
@RequiredArgsConstructor
public class SuggestRestController {

    private final HttpSession session;
    private final SuggestServiceImpl suggestService;

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
        Suggest suggest = suggestService.getSuggest(suggestId);

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
        Suggest suggest = suggestService.getSuggest(suggestId);
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
}
