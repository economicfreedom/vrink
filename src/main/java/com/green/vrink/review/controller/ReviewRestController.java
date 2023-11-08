package com.green.vrink.review.controller;

import com.green.vrink.message.service.MessageService;
import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.service.ReviewService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.EditorService;
import com.green.vrink.user.service.UserService;
import com.green.vrink.util.Check;
import com.green.vrink.util.LoginCheck;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import static com.green.vrink.util.Check.isNull;

@RestController
@RequestMapping("/review")
@Slf4j
@RequiredArgsConstructor
public class ReviewRestController {

    private final ReviewService reviewService;
    private final HttpSession httpSession;
    private final MessageService messageService;
    private final EditorService editorService;
    private final UserService userService;
    @PostMapping("/save")
    @LoginCheck
    public ResponseEntity<?> replySave(@Valid @RequestBody ReviewDTO reviewDTO, BindingResult bindingResult) {

        if (bindingResult.hasErrors()){
            String defaultMessage = bindingResult.getFieldError().getDefaultMessage();

            return ResponseEntity.badRequest().body(defaultMessage);
        }

        int editorId = reviewDTO.getEditorId();
        int userIdByEditorId = editorService
                              .getUserIdByEditorId(editorId);

        Integer userId = editorService.getUserIdByEditorId(reviewDTO.getEditorId());
        if (userId == userIdByEditorId){
            return ResponseEntity.badRequest().build();
        }


        Integer check = reviewService.duplicationCheck(reviewDTO);

//        if (check != null){
//            log.info("이미 작성한 작가");
//            return ResponseEntity.badRequest().build();
//        }

        Integer save = reviewService.save(reviewDTO);

        log.info("reply save start {}", save);



        String nickname = editorService.getNicknameByEditorId(editorId);

        String message = nickname+"작가님 리뷰가 달렸어요!";
        String url = "/editor/editor-detail/"+reviewDTO.getEditorId();

        messageService.sendMessageAndSaveSpecificPage(userId,message,url);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/del/{review-id}")
    @LoginCheck
    public ResponseEntity<?> replyDelete(@PathVariable(name = "review-id") Integer reviewId) {
        User user = (User) httpSession.getAttribute("USER");

        if (isNull(reviewId)){
            return ResponseEntity.badRequest().build();
        }

        int userId = user.getUserId();

        int reviewUserId = reviewService.getReviewUserId(reviewId);
        log.info("userId : {}",userId);
        log.info("reviewUser Id : {}",reviewUserId);
        if (userId != reviewUserId) {
            return ResponseEntity.badRequest().build();
        }

        log.info("review id {}", reviewId);
        reviewService.delete(reviewId);

        return ResponseEntity.ok().build();
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    private static class CustomMessage {
        private String message;
    }

}
