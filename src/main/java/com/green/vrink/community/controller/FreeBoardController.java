package com.green.vrink.community.controller;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.repository.model.FreeBoard;
import com.green.vrink.community.service.FreeBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board")
@Slf4j
@RequiredArgsConstructor
@Controller
public class FreeBoardController {

    private final FreeBoardService freeBoardService;

    @GetMapping("/write-form")
    public String read(Model model) {

        return "board/freeBoardWrite";
    }

    @GetMapping("/read/{community-id}")
    public String read(
            @PathVariable("community-id")
            Integer communityId,
            Model model
    ) {

        FreeBoardDTO dto =freeBoardService.read(communityId);
        if (dto==null){
            return "redirect:/";
        }
        model.addAttribute("dto",dto);

        return "board/freeBoardReadForm";
    }


}
