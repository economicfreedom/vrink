package com.green.vrink.follow.controller;

import com.green.vrink.follow.dto.GetFollowEditorDto;
import com.green.vrink.follow.service.FollowService;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/follow")
@RequiredArgsConstructor
public class FollowController {

    private final FollowService followService;
    @GetMapping("/follow-list/{userId}")
    public String followList(@PathVariable(name = "userId") Integer userId
                            ,@RequestParam(name = "page-num" ,defaultValue = "1") Integer pageNum
                            , @RequestParam(name = "keyword",defaultValue = "") String keyword
                            , @RequestParam(name = "type" ,defaultValue = "") String type
                            , Model model) {
        System.out.println("hi");
        Criteria criteria = new Criteria();
        criteria.setType(type);
        criteria.setKeyword(keyword);
        criteria.setCountPerPage(10);
        criteria.setPageNum(pageNum);
        criteria.setUserId(userId);

        Integer total = followService.getTotal(criteria);
        System.out.println(total);
        List<GetFollowEditorDto> getFollowEditorList = followService.getFollowEditorList(criteria);

        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(criteria);
        pageDTO.setArticleTotalCount(total);

        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("followEditor", getFollowEditorList);
        model.addAttribute("total", total);

        return "follow/followList";
    }
}
