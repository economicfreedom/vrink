package com.green.vrink.user.controller;

import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.service.ReviewService;
import com.green.vrink.user.dto.EditorDTO;
import com.green.vrink.user.service.EditorServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/editor")
@RequiredArgsConstructor
@Slf4j
public class EditorController {

    private final ReviewService reviewService;
    private final EditorServiceImpl editorServiceImpl;

    @GetMapping("/editor-detail/{editorId}")
    public String editorDetail(@PathVariable("editorId") Integer editorId, HttpSession session, Model model) {
        List<ReviewDTO> reviewDTOS = reviewService.findByIdAll(1); 
        model.addAttribute("reviewList",reviewDTOS);
        log.info("reviewList {}", reviewDTOS);
        
        EditorDTO editorDTO = editorServiceImpl.responseEditorDeatil(editorId);
        model.addAttribute("editorDetail", editorDTO);
        log.info("editorDetail{}",editorDTO);

        return "user/editorDetail";
    }

    @GetMapping("/editor-write")
    public String editorWrite() {

        return "user/editorWrite";
    }
    
    @GetMapping("/editor-edit/{editorId}")
    public String editorEdit(@PathVariable("editorId") Integer editorId, Model model) {
    	EditorDTO editorDTO = editorServiceImpl.responseEditorEdit(editorId);
    	model.addAttribute("editorEdit", editorDTO);
        return "user/editorEdit";
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
