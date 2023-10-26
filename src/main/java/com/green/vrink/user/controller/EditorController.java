package com.green.vrink.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/editor")
public class EditorController {

    @GetMapping("/editor-detail")
    public String editorDetail() {
        return "user/editorDetail";
    }
    
    @GetMapping("/editor-write")
    public String editorWrite() {
    	return "user/editorWrite";
    }
    
    @PostMapping("/editor-write")
    public String editorWriteProc() {
    	return "user/editorWrite";
    }
    
    @GetMapping("/login")
    public String login() {
    	return "layout/header";
    }

    @GetMapping("/apply-form")
    public String applyPage() {



        return "user/applyForm";
    }
}
