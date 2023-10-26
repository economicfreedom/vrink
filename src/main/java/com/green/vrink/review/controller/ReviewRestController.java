package com.green.vrink.review.controller;

import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/review")
@Slf4j
@RequiredArgsConstructor
public class ReviewRestController {

    private final ReviewService reviewService;

    @PostMapping("/save")
    public ResponseEntity<?> replySave(@RequestBody ReviewDTO reviewDTO){
        
        Integer check = reviewService.duplicationCheck(reviewDTO);

        if (check != null){
            log.info("이미 작성한 작가");
            return ResponseEntity.badRequest().build();
        }

        Integer save = reviewService.save(reviewDTO);
        log.info("reply save start");
        if (save != null){
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.badRequest().build();
    }
}
