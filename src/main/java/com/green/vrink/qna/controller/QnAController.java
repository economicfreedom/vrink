package com.green.vrink.qna.controller;


import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.qna.dto.AnswerDTO;
import com.green.vrink.qna.service.QnAService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Check;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.LoginCheck;
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

import static com.green.vrink.util.Check.isNull;

@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
@Slf4j
public class QnAController {

    private final QnAService qnAService;


    @GetMapping("/write")
    @LoginCheck
    public String write() {

        return "qna/qnaQuestion";
    }

    @GetMapping("/list/{user-id}")
    @LoginCheck
    public String list(
            @PathVariable(name = "user-id") Integer userId
            , @RequestParam(value = "page-num", defaultValue = "1")
            Integer pageNum

            , Model model
            , HttpSession httpSession
    ) {
        //세션에 유저 id 토탈에 넣기

        User user = (User) httpSession.getAttribute("USER");

        if (userId != user.getUserId()) {
            return "redirect:/";
        }

        Criteria cri = new Criteria();
        cri.setPageNum(pageNum);


        Integer total = qnAService.getTotal(userId);
        List<QuestionDTO> list = qnAService.list(userId, cri);
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(total);

        model.addAttribute("list", list);
        model.addAttribute("pageDTO", pageDTO);


        return "qna/qnaList";

    }

    @GetMapping("/read-q/{question-id}")
    @LoginCheck
    public String readQuestion(
            @PathVariable(name = "question-id") Integer questionId
            , Model model
    ) {
        if (isNull(questionId)) {
            return "redirect:/";
        }
        Integer userId = qnAService.getUserId(questionId);
        QuestionDTO qnADTO = qnAService.findById(questionId);
        AnswerDTO answer = qnAService.getQuestion(questionId);

        model.addAttribute("dto", qnADTO);
        model.addAttribute("answer", answer);


        return "qna/qnaShow";
    }


}
