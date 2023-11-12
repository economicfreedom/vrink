package com.green.vrink.follow.controller;

import com.green.vrink.follow.dto.FollowDto;
import com.green.vrink.follow.dto.GetFollowEditorDto;
import com.green.vrink.follow.repository.model.Follow;
import com.green.vrink.follow.service.FollowServiceImpl;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Define;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.Session;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/follow")
@RequiredArgsConstructor
@Slf4j
public class FollowRestController {
    private final FollowServiceImpl followService;
    private final HttpSession session;

    @PostMapping("/new-follow")
    public ResponseEntity<?> follow(@RequestBody FollowDto followDto) {
        CustomMessage customMessage = null;
        User user = (User) session.getAttribute(Define.USER);
        if (user == null) {
            customMessage = new CustomMessage("로그인이 필요한 작업입니다.", 401);
            return ResponseEntity.badRequest().body(customMessage);
        }
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
