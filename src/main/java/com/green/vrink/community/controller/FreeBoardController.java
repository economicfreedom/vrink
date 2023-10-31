package com.green.vrink.community.controller;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.community.service.FreeBoardReplyService;
import com.green.vrink.community.service.FreeBoardService;
import com.green.vrink.user.repository.model.User;
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

@RequestMapping("/board")
@Slf4j
@RequiredArgsConstructor
@Controller
public class FreeBoardController {

    private final FreeBoardService freeBoardService;
    private final FreeBoardReplyService freeBoardReplyService;
    private final HttpSession httpSession;



    @GetMapping("/123")
    @LoginCheck
    public String test(){
        return "board/test";
    }


    @GetMapping("/write-form")
    @LoginCheck
    public String read(Model model) {



        return "board/freeBoardWrite";
    }


    @GetMapping("/read/{community-id}")


    public String read(
            @PathVariable("community-id")
            Integer communityId,
            HttpSession httpSession,
            Model model
    ) {
        if (communityId == null) {
            return "redirect:/";
        }
        FreeBoardDTO dto = freeBoardService.read(communityId);
        if (dto == null) {
            return "redirect:/";
        }

        Criteria cri = new Criteria();
        Integer total = freeBoardReplyService.replyTotal(communityId);
        cri.setPageNum(1);
        cri.setCountPerPage(7);
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(total);

        List<FreeBoardReplyDTO> freeBoardReplyDTOS = freeBoardReplyService.readList(communityId,cri);
        log.info(pageDTO.toString());
        log.info("total : {}",total);

        boolean next = pageDTO.getEndPage() > 1;


        model.addAttribute("list",freeBoardReplyDTOS);
        model.addAttribute("dto", dto);
        model.addAttribute("next",next);
        model.addAttribute("total",total);

        return "board/freeBoardReadForm";
    }

    @GetMapping("/update-form/{community-id}")
    @LoginCheck
    public String update(
            @PathVariable("community-id")
            Integer communityId
            , Model model
            , HttpSession httpSession) {
        FreeBoardDTO dto = freeBoardService.read(communityId);
        model.addAttribute("dto",dto);
        User user = (User) httpSession.getAttribute("USER");
        Integer userId = freeBoardService.getUserId(communityId);

        if (user == null || userId != dto.getUserId() ){
            return "redirect:/";
        }


        return "board/freeBoardUpdateForm";
    }

    @GetMapping("/board-list") 
    public String list(
            @RequestParam(name = "page-num" ,defaultValue = "1") Integer pageNum
            ,@RequestParam(name = "keyword",defaultValue = "") String keyword
            ,@RequestParam(name = "type" ,defaultValue = "") String type
            ,Model model
    ){


        Criteria cri = new Criteria();
        cri.setType(type);
        cri.setKeyword(keyword);
        cri.setCountPerPage(10);
        cri.setPageNum(pageNum);
        log.info(cri.toString());
        Integer total = freeBoardService.getTotal(cri);
        List<FreeBoardDTO> list = freeBoardService.pageList(cri);

        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(total);
        model.addAttribute("pageDTO",pageDTO);
        model.addAttribute("list",list);
        model.addAttribute("total",total);
        return "board/freeBoardList";
    }

}
