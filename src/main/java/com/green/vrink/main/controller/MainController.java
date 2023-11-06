package com.green.vrink.main.controller;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.service.FreeBoardService;
import com.green.vrink.review.dto.ReviewCountDTO;
import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.service.ReviewService;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    private final FreeBoardService freeBoardService;
    private final ReviewService reviewService;
    @GetMapping("/")

    public String main(Model model){
        Criteria cri = new Criteria();
        cri.setType("");
        cri.setKeyword("");
        cri.setCountPerPage(5);
        cri.setPageNum(1);
        log.info(cri.toString());
        Integer total = freeBoardService.getTotal(cri);
        List<FreeBoardDTO> boardList = freeBoardService.pageList(cri);
        List<ReviewCountDTO> reviewList = reviewService.getList();
        log.info("board {}",boardList);
        log.info("review {}",reviewList);
        model.addAttribute("boardList",boardList);
        model.addAttribute("reviewList",reviewList);



        return "main";
    }
}
