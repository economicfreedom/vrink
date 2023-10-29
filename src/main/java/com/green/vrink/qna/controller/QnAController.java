package com.green.vrink.qna.controller;


import com.green.vrink.qna.dto.QnADTO;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.qna.service.QnAService;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
@Slf4j
public class QnAController {

    private final QnAService qnAService;

    @GetMapping("/write")
    public String write() {

        return "qna/qnaAnswer";
    }

    @GetMapping("/list")
    public String list(
            @RequestParam(value = "page-num", defaultValue = "1")
            Integer pageNum
            , Model model
            , HttpSession httpSession
    ) {
        //세션에 유저 id 토탈에 넣기

        Criteria cri = new Criteria();
        cri.setPageNum(pageNum);

        Integer total = qnAService.getTotal(1);
        List<QnADTO> list = qnAService.list(1, cri);
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(total);

        model.addAttribute("list", list);
        model.addAttribute("pageDTO", pageDTO);


        return "qna/qnaList";

    }

    @GetMapping("/read-q/{qna-id}")
    public String readQuestion(
            @PathVariable(name = "qna-id") Integer qnaId
            , Model model
    ) {

        QnADTO qnADTO = qnAService.findById(qnaId);
        QuestionDTO question = qnAService.getQuestion(qnaId);

        model.addAttribute("dto",qnADTO);
        model.addAttribute("question",question);


        return "qna/qnaShow";
    }


}
