package com.green.vrink.community.controller;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.service.FreeBoardService;
import com.green.vrink.message.service.MessageService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Check;
import com.green.vrink.util.LoginCheck;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import static com.green.vrink.util.Check.isNull;

@RequestMapping("/board")
@RequiredArgsConstructor
@RestController
@Slf4j
public class FreeBoardRestController {

    private final FreeBoardService freeBoardService;
    private final HttpSession httpSession;
    private final MessageService messageService;

    @PostMapping("/write")
    public ResponseEntity<?> write(@Valid @RequestBody FreeBoardDTO freeBoardDTO) {
        isNull("test");
        User user = (User) httpSession.getAttribute("USER");

        if (freeBoardDTO.getUserId() == null) {
            return ResponseEntity.badRequest().build();
        }


        freeBoardService.create(freeBoardDTO);
        log.info("freeBobard dto {}", freeBoardDTO);


        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/del/{community-id}")

    public ResponseEntity<?> delete(
            @PathVariable("community-id")
            Integer communityId
    ) {
        int userId = freeBoardService.getUserId(communityId);
        User user = (User) httpSession.getAttribute("USER");
        int sessionUserId = user.getUserId();
        if (userId != sessionUserId) {
            return ResponseEntity.badRequest().build();
        }
        freeBoardService.delete(communityId);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/update")
    public ResponseEntity<?> update(
            @Valid @RequestBody FreeBoardDTO freeBoardDTO, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            String defaultMessage = bindingResult.getFieldError().getDefaultMessage();

            log.info("validation 동작 에러 메세지 {}", defaultMessage);
            return ResponseEntity.badRequest().body(defaultMessage);
        }
        if (isNull(freeBoardDTO.getCommunityId())) {
            return ResponseEntity.badRequest().body("게시글 번호는 필수값입니다.");
        }
        Integer userId = freeBoardDTO.getUserId();
        User user = (User) httpSession.getAttribute("USER");
        Integer commUserId = freeBoardService.getUserId(freeBoardDTO.getCommunityId());
        Integer sessionUserId = user.getUserId();

        if (userId.intValue() != commUserId.intValue()
                || sessionUserId.intValue() != commUserId.intValue()){

            return new ResponseEntity<>("접근권한이 없습니다.", HttpStatus.FORBIDDEN);
        }


        log.info("update freeBoardDTO", freeBoardDTO);
        freeBoardService.update(freeBoardDTO);

        return ResponseEntity.ok().build();
    }

}
