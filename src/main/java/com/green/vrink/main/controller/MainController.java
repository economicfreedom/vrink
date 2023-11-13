package com.green.vrink.main.controller;

import com.green.vrink.ad.ADService;
import com.green.vrink.admin.dto.AdminAdDto;
import com.green.vrink.admin.dto.PagingDto;
import com.green.vrink.admin.service.AdminService;
import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.service.FreeBoardService;
import com.green.vrink.main.RankDTO;
import com.green.vrink.main.service.MainService;
import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.notice.service.NoticeService;
import com.green.vrink.review.dto.ReviewCountDTO;
import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.service.ReviewService;
import com.green.vrink.suggest.dto.GetSuggestDto;
import com.green.vrink.suggest.service.SuggestService;
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
    private final MainService mainService;
    private final SuggestService suggestService;
    private final NoticeService noticeService;
    private final ADService adService;
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

        model.addAttribute("boardList",boardList);
        model.addAttribute("reviewList",reviewList);

        List<RankDTO> dailyList = mainService.getDaily();
        List<RankDTO> weeklyList = mainService.getWeekly();
        List<RankDTO> monthlyList = mainService.getMonthly();
        model.addAttribute("dailyList",dailyList);
        model.addAttribute("weeklyList",weeklyList);
        model.addAttribute("monthlyList",monthlyList);

        Criteria criteria = new Criteria();
        criteria.setCountPerPage(5);
        List<GetSuggestDto> suggestList = suggestService.getSuggestList(criteria);
        model.addAttribute("suggestList", suggestList);

        List<NoticeDto> noticeList = noticeService.getNoticeList(criteria);
        model.addAttribute("noticeList",noticeList);

        List<AdminAdDto> adMainList = adService.getMainAdList();
        model.addAttribute("adMainList",adMainList);

        List<AdminAdDto> adSideList = adService.getSideAdList();
        model.addAttribute("adSideList", adSideList);

        return "main";
    }
}
