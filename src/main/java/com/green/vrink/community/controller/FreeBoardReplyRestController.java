package com.green.vrink.community.controller;


import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.AsyncPageDTO;
import com.green.vrink.community.service.FreeBoardReplyService;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.LoginCheck;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/free-reply")
@RequiredArgsConstructor
@Slf4j
public class FreeBoardReplyRestController {
    private final FreeBoardReplyService freeBoardReplyService;
    private final HttpSession httpSession;

    @PostMapping("/add")
    @LoginCheck
    public ResponseEntity<?> write(
            @RequestBody
            FreeBoardReplyDTO freeBoardReplyDTO


    ) {


        log.info("freeBoardReplyDTO {}", freeBoardReplyDTO);
        freeBoardReplyService.create(freeBoardReplyDTO);

        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/del/{reply-id}")
    @LoginCheck
    public ResponseEntity<?> del(
            @PathVariable(name = "reply-id")
            Integer replyId
    ) {
        if (replyId == null) {
            return ResponseEntity.badRequest().build();
        }

        User user = (User) httpSession.getAttribute("USER");
        int sessionUserId = user.getUserId();

        if (sessionUserId == 0) {
            freeBoardReplyService.delete(replyId);
            return ResponseEntity.ok().build();
        }

        int userId = freeBoardReplyService.getUserId(replyId);

        if (userId != sessionUserId) {
            return ResponseEntity.badRequest().build();
        }

        freeBoardReplyService.delete(replyId);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/update")
    @LoginCheck
    public ResponseEntity<?> update(
            @RequestBody
            FreeBoardReplyDTO freeBoardReplyDTO
            , HttpSession httpSession
    ) {
        int replyId = freeBoardReplyDTO.getReplyId();
        Integer communityId = freeBoardReplyDTO.getCommunityId();

        Integer _userId = freeBoardReplyDTO.getUserId();
        Integer userId = freeBoardReplyService.getUserId(replyId);

        if (communityId == null || _userId == null || _userId != userId) {
            return ResponseEntity.badRequest().build();
        }

        freeBoardReplyService.update(freeBoardReplyDTO);

        return ResponseEntity.ok().build();
    }

    @GetMapping("/more-reply")
    public ResponseEntity<?> more(@RequestParam(name = "commu-id")
                                  Integer replyId
            , @RequestParam(name = "page-num")
                                  Integer pageNum
            , @RequestParam
                                  Integer total
    ) {
        log.info("동작함 ");
        Criteria cri = new Criteria();
        cri.setPageNum(pageNum);
        cri.setCountPerPage(7);
        List<FreeBoardReplyDTO> freeBoardReplyDTOS = freeBoardReplyService.readList(replyId, cri);

        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(total);
        AsyncPageDTO asyncPageDTO = new AsyncPageDTO();
        asyncPageDTO.setHasNext(pageNum, pageDTO.getEndPage());
        asyncPageDTO.setPageDTOs(freeBoardReplyDTOS);

        return ResponseEntity.ok().body(asyncPageDTO);
    }
}
