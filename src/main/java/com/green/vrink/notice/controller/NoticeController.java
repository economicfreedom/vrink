package com.green.vrink.notice.controller;

import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.notice.service.NoticeService;
import com.green.vrink.suggest.dto.GetSuggestDto;
import com.green.vrink.suggest.dto.SuggestReplyDto;
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

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {
    private final NoticeService noticeService;
    @GetMapping("/notice-list")
    public String getNoticeList(@RequestParam(name = "page-num" ,defaultValue = "1") Integer pageNum
            , @RequestParam(name = "keyword",defaultValue = "") String keyword
            , @RequestParam(name = "type" ,defaultValue = "") String type
            , Model model) {
        Criteria criteria = new Criteria();
        criteria.setType(type);
        criteria.setKeyword(keyword);
        criteria.setCountPerPage(10);
        criteria.setPageNum(pageNum);

        Integer total = noticeService.getTotal(criteria);
        List<NoticeDto> noticeList = noticeService.getNoticeList(criteria);
        log.info("list : {} ", noticeList);
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(criteria);
        pageDTO.setArticleTotalCount(total);

        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("total", total);

        return "notice/noticeList";
    }

    @GetMapping("/{noticeId}")
    public String getSuggest(@PathVariable int noticeId, Model model) {
        NoticeDto notice = noticeService.getNotice(noticeId);
        if (notice == null) {
            return "main";
        }

        model.addAttribute("notice", notice);
        return "notice/noticeDetail";
    }
}
