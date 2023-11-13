package com.green.vrink.review.controller;

import com.green.vrink.message.service.MessageService;
import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.service.ReviewService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.EditorService;
import com.green.vrink.user.service.UserService;
import com.green.vrink.util.Check;
import com.green.vrink.util.Define;
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
    public ResponseEntity<?> replySave(@Valid @RequestBody ReviewDTO reviewDTO, BindingResult bindingResult) {


        if (bindingResult.hasErrors()) {
            log.info("유효성 에러");
            String defaultMessage = bindingResult.getFieldError().getDefaultMessage();
            CustomMessage customMessage = new CustomMessage(defaultMessage,400);

            return ResponseEntity.badRequest().body(customMessage);
        }

        User user = (User) httpSession.getAttribute(Define.USER);

        if (isNull(user)) {
            CustomMessage customMessage = new CustomMessage(
                    "로그인후 사용 가능합니다."
                    , 400);

            return ResponseEntity.badRequest().body(customMessage);
        }


        int editorId = reviewDTO.getEditorId();
        int userIdByEditorId = editorService
                .getUserIdByEditorId(editorId);

        Integer userId = user.getUserId();

        if (userId == userIdByEditorId) {
            CustomMessage customMessage = new CustomMessage(
                    "본인 게시글의 리뷰를 작성하실 수 없습니다."
                    ,  400);
            return ResponseEntity.badRequest().body(customMessage);
        }

        log.info("if 문 start === > ");

        boolean hasReviewCount = reviewService.hasReviewCount(userId, editorId);
        log.info("hasReviewCount {}", hasReviewCount);
        if (!hasReviewCount) {
            CustomMessage customMessage = new CustomMessage(
                    "구매가 완료된 후 리뷰 작성이 가능합니다."
                    , 400);
            return ResponseEntity.badRequest().body(customMessage);
        }
        log.info("if 문 done === > ");
        Integer save = reviewService.save(reviewDTO);


        log.info("reply save start {}", save);


        String nickname = editorService.getNicknameByEditorId(editorId);

        String message = nickname + "작가님 리뷰가 달렸어요!";
        String url = "/editor/editor-detail/" + reviewDTO.getEditorId();

        messageService.sendMessageAndSaveSpecificPage(userIdByEditorId, message, url);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/del/{review-id}")
    @LoginCheck
    public ResponseEntity<?> replyDelete(@PathVariable(name = "review-id") Integer reviewId) {
        User user = (User) httpSession.getAttribute("USER");

        if (isNull(reviewId)) {
            return ResponseEntity.badRequest().build();
        }

        int userId = user.getUserId();

        int reviewUserId = reviewService.getReviewUserId(reviewId);
        log.info("userId : {}", userId);
        log.info("reviewUser Id : {}", reviewUserId);
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
        private int code;
    }

}
