package com.green.vrink.review.controller;

import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.service.ReviewService;
import com.green.vrink.user.repository.model.User;
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

    @PostMapping("/save")
    @LoginCheck
    public ResponseEntity<?> replySave(@Valid @RequestBody ReviewDTO reviewDTO, BindingResult bindingResult) {

        if (bindingResult.hasErrors()){
            String defaultMessage = bindingResult.getFieldError().getDefaultMessage();

            return ResponseEntity.badRequest().body(defaultMessage);
        }



        Integer check = reviewService.duplicationCheck(reviewDTO);

//        if (check != null){
//            log.info("이미 작성한 작가");
//            return ResponseEntity.badRequest().build();
//        }

        Integer save = reviewService.save(reviewDTO);

        log.info("reply save start {}", save);

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
