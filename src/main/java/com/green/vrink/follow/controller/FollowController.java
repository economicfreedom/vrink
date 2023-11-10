package com.green.vrink.follow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/follow")
public class FollowController {
    @GetMapping("/follow-list/{userId}")
    public String followList(@PathVariable Integer userId) {
        return "follow/followList";
    }
}
