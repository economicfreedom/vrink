package com.green.vrink.follow.controller;

import com.green.vrink.follow.dto.FollowDto;
import com.green.vrink.follow.repository.model.Follow;
import com.green.vrink.follow.service.FollowServiceImpl;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/follow")
@RequiredArgsConstructor
@Slf4j
public class FollowRestController {
    private final FollowServiceImpl followService;

    @PostMapping("/new-follow")
    public ResponseEntity<?> follow(@RequestBody FollowDto followDto) {
        CustomMessage customMessage = null;
        int result = followService.follow(followDto);
        if (result == 0) {
            customMessage = new CustomMessage("팔로우 할 수 없는 대상입니다.", 400);
            return ResponseEntity.badRequest().body(customMessage);
        } else if (result == 2) {
            customMessage = new CustomMessage("팔로우가 취소되었습니다.", 201);
            return ResponseEntity.ok().body(customMessage);
        }
        customMessage = new CustomMessage("팔로우 하였습니다.", 200);

        return ResponseEntity.ok().body(customMessage);
    }

    @GetMapping("/get-follow-list/{userId}")
    public List<Follow> getFollowList(@PathVariable Integer userId) {
        return followService.getFollowList(userId);
    }

    @PostMapping("/is-follow")
    public Integer isFollow(@RequestBody FollowDto followDto) {
        return followService.isFollow(followDto);
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    private static class CustomMessage {
        private String message;
        private Integer code;
    }
}
