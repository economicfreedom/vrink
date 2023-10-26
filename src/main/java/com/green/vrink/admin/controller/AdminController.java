package com.green.vrink.admin.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final HttpSession httpSession;

    @GetMapping("/main")
    public String main(){
        return "/admin/main";
    }

    @GetMapping("/applyAccept")
    public String applyAccept(){
        return "/admin/applyAccept";
    }

}