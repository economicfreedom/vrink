package com.green.vrink.community.controller;


import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.*;
import com.green.vrink.community.service.FreeBoardReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Objects;

import static com.green.vrink.util.Check.isNull;

@RestController
@RequestMapping("/free-reply")
@RequiredArgsConstructor
@Slf4j
public class FreeBoardReplyRestController {
    private final FreeBoardReplyService freeBoardReplyService;
    private final HttpSession httpSession;
//    private final Check check;

    @PostMapping("/add")
    @LoginCheck
    public ResponseEntity<?> write(
            @Valid
            @RequestBody
            FreeBoardReplyDTO freeBoardReplyDTO
            ,BindingResult bindingResult


    ) {
        if (bindingResult.hasErrors()){
            String defaultMessage = bindingResult.getFieldError().getDefaultMessage();
            return ResponseEntity.badRequest().body(defaultMessage);
        }


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
        if (isNull(replyId)) {
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
            @Valid
            @RequestBody

            FreeBoardReplyDTO freeBoardReplyDTO
            , HttpSession httpSession
            , BindingResult bindingResult
    ) {
        int replyId = freeBoardReplyDTO.getReplyId();

        if (isNull(replyId)){
            return ResponseEntity.badRequest().body("댓글 번호는 필수 값입니다.");
        }
        if (bindingResult.hasErrors()) {
            String defaultMessage = bindingResult.getFieldError().getDefaultMessage();
            return ResponseEntity.badRequest().body(defaultMessage);

        }

        Integer _userId = freeBoardReplyDTO.getUserId();
        Integer userId = freeBoardReplyService.getUserId(replyId);

        if (_userId != userId) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("수정 권한이 없습니다.");
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
