package com.green.vrink.admin.controller;

import com.green.vrink.admin.dto.*;
import com.green.vrink.admin.service.AdminService;
import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.community.service.FreeBoardReplyService;
import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.qna.service.QnAService;
import com.green.vrink.suggest.dto.AdminSuggestDto;
import com.green.vrink.suggest.dto.GetSuggestDto;
import com.green.vrink.suggest.dto.SuggestReplyDto;
import com.green.vrink.suggest.service.SuggestService;
import com.green.vrink.util.AdminCheck;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.PageDTO;
import com.green.vrink.util.Test;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final HttpSession session;
    private final AdminService adminService;
    private final FreeBoardReplyService freeBoardReplyService;
    private final QnAService qnAService;
    private final SuggestService suggestService;

    private final Test test;

    @GetMapping("/main")
    @AdminCheck
    public String main(Model model) {
        log.info("관리자 페이지 메인 컨트롤러 실행");

        model.addAttribute("userSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("user", "count(*)", "created_at"));
        model.addAttribute("userWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("user", "count(*)", "created_at"));
        model.addAttribute("userMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("user", "count(*)", "created_at"));
        model.addAttribute("freeBoardSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("community", "count(*)", "created_at"));
        model.addAttribute("freeBoardWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("community", "count(*)", "created_at"));
        model.addAttribute("freeBoardMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("community", "count(*)", "created_at"));
        model.addAttribute("suggestSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("suggest", "count(*)", "created_at"));
        model.addAttribute("suggestWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("suggest", "count(*)", "created_at"));
        model.addAttribute("suggestMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("suggest", "count(*)", "created_at"));
        model.addAttribute("bannerSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("ad", "count(*)", "created_at"));
        model.addAttribute("bannerWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("ad", "count(*)", "created_at"));
        model.addAttribute("bannerMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("ad", "count(*)", "created_at"));

        model.addAttribute("calculatorSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("calculator", "count(*)", "complete_date"));
        model.addAttribute("calculatorWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("calculator", "count(*)", "complete_date"));
        model.addAttribute("calculatorMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("calculator", "count(*)", "complete_date"));

        model.addAttribute("editorSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("user", "count(*)", "editor_created_at"));
        model.addAttribute("editorWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("user", "count(*)", "editor_created_at"));
        model.addAttribute("editorMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("user", "count(*)", "editor_created_at"));

        model.addAttribute("standardNum", adminService.countStandardUser());
        model.addAttribute("editorNum", adminService.countEditorUser());
        model.addAttribute("enabledNum", adminService.countEnabledUser());

        model.addAttribute("bannerPriceSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("ad", "sum(price)", "created_at"));
        model.addAttribute("bannerPriceWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("ad", "sum(price)", "created_at"));
        model.addAttribute("bannerPriceMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("ad", "sum(price)", "created_at"));

        model.addAttribute("bannerMaxSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("ad", "max(price)", "created_at"));
        model.addAttribute("bannerMaxWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("ad", "max(price)", "created_at"));
        model.addAttribute("bannerMaxMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("ad", "max(price)", "created_at"));

        model.addAttribute("bannerStdSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("ad", "std(price)", "created_at"));
        model.addAttribute("bannerStdWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("ad", "std(price)", "created_at"));
        model.addAttribute("bannerStdMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("ad", "std(price)", "created_at"));


        model.addAttribute("calculatorPriceSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("calculator", "sum(cal_price-real_cal_price)", "complete_date"));
        model.addAttribute("calculatorPriceWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("calculator", "sum(cal_price-real_cal_price)", "complete_date"));
        model.addAttribute("calculatorPriceMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("calculator", "sum(cal_price-real_cal_price)", "complete_date"));

        model.addAttribute("calculatorMaxSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("calculator", "max(cal_price-real_cal_price)", "complete_date"));
        model.addAttribute("calculatorMaxWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("calculator", "max(cal_price-real_cal_price)", "complete_date"));
        model.addAttribute("calculatorMaxMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("calculator", "max(cal_price-real_cal_price)", "complete_date"));

        model.addAttribute("calculatorStdSevenDate", adminService.getDateCustomSevenDaysByTableNameValueWhen
                ("calculator", "std(cal_price-real_cal_price)", "complete_date"));
        model.addAttribute("calculatorStdWeekDate", adminService.getDateCustomWeekByTableNameValueWhen
                ("calculator", "std(cal_price-real_cal_price)", "complete_date"));
        model.addAttribute("calculatorStdMonthDate", adminService.getDateCustomMonthByTableNameValueWhen
                ("calculator", "std(cal_price-real_cal_price)", "complete_date"));

        return "/admin/main";
    }

    @GetMapping("/apply-accept")
    @AdminCheck
    public String applyAccept(@ModelAttribute("paging") PagingDto paging,
                              @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                              @RequestParam(value = "reset", required = false, defaultValue = "2") String reset,
                              Model model) {

        log.info("판매자 신청 목록 컨트롤러 호출");

        if (reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
            session.removeAttribute("nowPage");
        }

        try {
            page = (int) session.getAttribute("nowPage");
        } catch (Exception ignored) {
        }


        paging.setPage(page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);

        int count = adminService.countAllAdminApply();
        pagination.setArticleTotalCount(count);

        List<AdminApplyDto> adminApplyList = adminService.getAllAdminApplyListByPaging(paging);

        model.addAttribute("adminApplyList", adminApplyList);
        model.addAttribute("pagination", pagination);

        return "/admin/applyAccept";
    }

    @GetMapping("/freeboard")
    @AdminCheck
    public String freeBoard(@ModelAttribute("paging") PagingDto paging,
                            @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                            @RequestParam(value = "reset", required = false, defaultValue = "2") String reset,
                            Model model) {

        log.info("자유게시판 목록 컨트롤러 호출");

        paging.setRecordSize(20);

        if (reset.equals("1")) {
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
            session.removeAttribute("nowPage");
        }

        try {
            page = (int) session.getAttribute("nowPage");
        } catch (Exception ignored) {
        }

        paging.setPage(page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);

        int count = adminService.countAllFreeboard();
        pagination.setArticleTotalCount(count);

        List<FreeBoardDTO> freeBoardDTOList = adminService.getAllFreeboardListByPaging(paging);

        for (FreeBoardDTO freeBoardDto : freeBoardDTOList) {
            if (freeBoardDto.getContent().contains("<img")) {
                freeBoardDto.setContent("이미지 파일 포함");
            } else {
                freeBoardDto.setContent(freeBoardDto.getContent().replaceAll("<br>", ""));
            }
        }

        model.addAttribute("freeboardList", freeBoardDTOList);
        model.addAttribute("pagination", pagination);

        return "/admin/freeboardAdmin";
    }

    @GetMapping("/freeboard-detail")
    public String freeboardDetail(@ModelAttribute("page") int page, @RequestParam("id") int id, Model model) {

        FreeBoardDTO freeBoardDTO = adminService.getFreeboardById(id);

        Criteria cri = new Criteria();
        Integer total = freeBoardReplyService.replyTotal(freeBoardDTO.getCommunityId());
        cri.setPageNum(1);
        cri.setCountPerPage(7);
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(total);

        List<FreeBoardReplyDTO> freeBoardReplyDTOS = freeBoardReplyService.readList(freeBoardDTO.getCommunityId(), cri);

        boolean next = pageDTO.getEndPage() > 1;

        model.addAttribute("list", freeBoardReplyDTOS);
        model.addAttribute("dto", freeBoardDTO);
        model.addAttribute("next", next);
        model.addAttribute("total", total);

        return "admin/freeboardDetail";
    }

    @GetMapping("/suggest")
    public String suggest(@ModelAttribute("paging") PagingDto paging,
                          @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                          @RequestParam(value = "reset", required = false, defaultValue = "2") String reset,
                          @RequestParam(value = "classification", required = false, defaultValue = "전체")
                          String classification,
                          Model model) {

        log.info("의뢰게시판 목록 컨트롤러 호출");

        paging.setRecordSize(10);

        if (classification.equals("전체")) paging.setClassification("3");
        else paging.setClassification(classification);

        if (reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
            session.removeAttribute("nowPage");
        }

        try {
            page = (int) session.getAttribute("nowPage");
        } catch (Exception ignored) {
        }

        paging.setPage(page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);

        int count = adminService.countAllSuggest(paging);
        pagination.setArticleTotalCount(count);

        List<AdminSuggestDto> adminSuggestDtoList = adminService.getAllSuggestListByPaging(paging);

        for (AdminSuggestDto suggestDto : adminSuggestDtoList) {
            if (suggestDto.getContent().contains("<img")) {
                suggestDto.setContent("이미지 파일 포함");
            } else {
                suggestDto.setContent(suggestDto.getContent().replaceAll("<br>", ""));
            }
        }

        model.addAttribute("suggestList", adminSuggestDtoList);
        model.addAttribute("pagination", pagination);

        return "/admin/suggestAdmin";
    }

    @GetMapping("/suggest-detail")
    public String suggestDetail(@ModelAttribute("page") int page,
                                @RequestParam("id") int id,
                                @RequestParam("nickname") String nickname,
                                Model model) {

        GetSuggestDto suggest = suggestService.getSuggest(id);

        if (suggest == null) {
            return "main";
        }

        AdminSuggestDto adminSuggestDto = AdminSuggestDto.builder()
                .title(suggest.getTitle())
                .suggestId(suggest.getSuggestId())
                .content(suggest.getContent())
                .createdAt(suggest.getCreatedAt())
                .nickname(nickname)
                .state(suggest.getState())
                .count(0)
                .build();

        Criteria cri = new Criteria();
        Integer replyCount = suggestService.getReplyCount(id);
        cri.setPageNum(1);
        cri.setCountPerPage(5);

        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(replyCount);

        List<SuggestReplyDto> replyList = suggestService.getSuggestReplyList(id, cri);

        boolean next = pageDTO.getEndPage() > 1;

        model.addAttribute("suggest", adminSuggestDto);
        model.addAttribute("suggestReply", replyList);
        model.addAttribute("next", next);
        model.addAttribute("replyCount", replyCount);

        return "admin/suggestDetail";
    }

    @GetMapping("/user")
    public String userAdmin(@ModelAttribute("paging") PagingDto paging,
                            @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                            @RequestParam(value = "classification2", required = false, defaultValue = "전체") String classification2,
                            @RequestParam(value = "classification3", required = false, defaultValue = "전체") String classification3,
                            @RequestParam(value = "searchType", required = false, defaultValue = "전체") String searchType,
                            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                            @RequestParam(value = "reset", required = false, defaultValue = "2") String reset,
                            Model model) {

        log.info("유저 관리 페이지 컨트롤러 호출");

        if (reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uClassification2");
            session.removeAttribute("uClassification3");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
            session.removeAttribute("nowPage");
        }

        try {
            page = (int) session.getAttribute("nowPage");
        } catch (Exception ignored) {
        }

        paging.setPage(page);
        if (classification2.equals("전체")) paging.setClassification2("3");
        else paging.setClassification2(classification2);
        if (classification3.equals("전체")) paging.setClassification3("3");
        else paging.setClassification3(classification3);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);

        int count = adminService.userTotalCount(paging);
        pagination.setArticleTotalCount(count);

        model.addAttribute("userList", adminService.getAllUserPaging(paging));
        model.addAttribute("pagination", pagination);

        return "admin/userListAdmin";
    }

    @GetMapping("/user/detail")
    public String userDetail(@ModelAttribute("page") int page, @RequestParam("id") int id, Model model) {
        model.addAttribute("userDetail", adminService.getUserById(id));
        return "admin/userDetailAdmin";
    }

    @GetMapping("/user/detail-nickname")
    public String userDetail(@RequestParam("nickname") String nickname, Model model) {
        model.addAttribute("userDetail", adminService.getUserByNickname(nickname));
        return "admin/userDetailAdmin";
    }

    @GetMapping("/question")
    public String questionAdmin(@ModelAttribute("paging") PagingDto paging,
                                @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                                @RequestParam(value = "classification2", required = false, defaultValue = "전체")
                                String classification2,
                                @RequestParam(value = "reset", required = false, defaultValue = "2") String reset,
                                Model model) {

        log.info("문의 관리 페이지 컨트롤러 호출");

        if (classification2.equals("전체")) paging.setClassification2("3");
        else paging.setClassification2(classification2);

        if (reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uClassification2");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
            session.removeAttribute("nowPage");
        }

        try {
            page = (int) session.getAttribute("nowPage");
        } catch (Exception ignored) {
        }

        paging.setPage(page);
        Pagination pagination = new Pagination();
        pagination.setPaging(paging);

        int count = adminService.questionTotalCount(paging);
        pagination.setArticleTotalCount(count);

        model.addAttribute("questionList", adminService.getAllQuestionPaging(paging));

        model.addAttribute("pagination", pagination);

        return "admin/questionListAdmin";
    }

    @GetMapping("/question/detail")
    public String questionDetail(@ModelAttribute("page") int page, @RequestParam("id") int id, Model model) {
        model.addAttribute("questionDetail", adminService.getQuestionById(id));
        model.addAttribute("answer", qnAService.getQuestion(id));

        return "admin/questionDetailAdmin";
    }

    @GetMapping("/ad-admin")
    public String adAdmin(@ModelAttribute("paging") PagingDto paging,
                          @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                          @RequestParam(value = "classification2", required = false, defaultValue = "전체") String classification2,
                          @RequestParam(value = "classification3", required = false, defaultValue = "전체") String classification3,
                          @RequestParam(value = "reset", required = false, defaultValue = "2") String reset,
                          Model model) {

        log.info("배너광고 목록 컨트롤러 호출");

        if (reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uClassification2");
            session.removeAttribute("uClassification3");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
            session.removeAttribute("nowPage");
        }

        try {
            page = (int) session.getAttribute("nowPage");
        } catch (Exception ignored) {
        }

        paging.setPage(page);
        if (classification2.equals("전체")) paging.setClassification2("3");
        else paging.setClassification2(classification2);
        if (classification3.equals("전체")) paging.setClassification3("3");
        else paging.setClassification3(classification3);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);

        int count = adminService.countAllAd(paging);
        pagination.setArticleTotalCount(count);

        List<AdminAdDto> adminAdList = adminService.getAllAdListByPaging(paging);

        model.addAttribute("adminAdList", adminAdList);
        model.addAttribute("pagination", pagination);

        return "/admin/adAdmin";
    }

    @GetMapping("/ad-admin/detail")
    public String adDetail(@ModelAttribute("page") int page, @RequestParam("id") int id, Model model) {
        model.addAttribute("adDetail", adminService.getAdById(id));
        return "admin/adDetailAdmin";
    }

    @GetMapping("/ad-admin/write")
    public String adWrite() {
        return "admin/adWrite";
    }

    @GetMapping("/payment-admin")
    @AdminCheck
    public String paymentAdmin(@ModelAttribute("paging") PagingDto paging,
                               @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                               @RequestParam(value = "reset", required = false, defaultValue = "2") String reset,
                               Model model) {

        log.info("결제 목록 컨트롤러 호출");

        if (reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
            session.removeAttribute("nowPage");
        }

        try {
            page = (int) session.getAttribute("nowPage");
        } catch (Exception ignored) {
        }

        paging.setPage(page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);

        int count = adminService.countAllAdminPayment();
        pagination.setArticleTotalCount(count);

        List<AdminPaymentDto> adminPaymentList = adminService.getAllAdminPaymentListByPaging(paging);

        model.addAttribute("adminPaymentList", adminPaymentList);
        model.addAttribute("pagination", pagination);

        return "/admin/paymentAdmin";
    }

    @GetMapping("/payment-admin/detail")
    public String paymentAdminDetail(@ModelAttribute("page") int page, @RequestParam("id") int id, Model model) {
        model.addAttribute("adminPaymentDetailList", adminService.getAdminPaymentDetailsById(id));
        model.addAttribute("adminPaymentStateList", adminService.getAdminPaymentStatesById(id));
        model.addAttribute("adminPayment", adminService.getAdminPaymentDtoById(id));
        return "admin/paymentDetailAdmin";
    }


    @GetMapping("/calculator-admin")
    @AdminCheck
    public String calculatorAdmin(@ModelAttribute("paging") PagingDto paging,
                                  @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                                  @RequestParam(value = "reset", required = false, defaultValue = "2") String reset,
                                  Model model) {

        log.info("결제 목록 컨트롤러 호출");

        if (reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
            session.removeAttribute("nowPage");
        }

        try {
            page = (int) session.getAttribute("nowPage");
        } catch (Exception ignored) {
        }

        paging.setPage(page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);

        int count = adminService.countAllAdminCalculator();
        pagination.setArticleTotalCount(count);

        List<AdminCalculatorDto> adminCalculatorList = adminService.getAllAdminCalculatorListByPaging(paging);

        model.addAttribute("adminCalculatorList", adminCalculatorList);
        model.addAttribute("pagination", pagination);

        return "/admin/calculatorAdmin";
    }

    @GetMapping("/calculator-admin/detail")
    public String calculatorAdminDetail(@ModelAttribute("page") int page,
                                        @RequestParam("id") int id,
                                        @RequestParam("nickname") String nickname,
                                        Model model) {
        model.addAttribute("calculatorDetailOkList", adminService.getAdminCalculatorDetailOkListByEditorId(id));
        model.addAttribute("calculatorDetailNoList", adminService.getAdminCalculatorDetailNoListByEditorId(id));
        model.addAttribute("userDto", adminService.getUserByNickname(nickname));
        return "admin/calculatorDetailAdmin";
    }


    @GetMapping("/notice")
    public String notice(@ModelAttribute("paging") PagingDto paging,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "reset", required = false, defaultValue = "2") String reset,
                         @RequestParam(value = "classification", required = false, defaultValue = "전체")
                         String classification,
                         Model model) {

        log.info("의뢰게시판 목록 컨트롤러 호출");

        paging.setRecordSize(10);

        if (classification.equals("전체")) paging.setClassification(null);
        else paging.setClassification(classification);

        if (reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
            session.removeAttribute("nowPage");
        }

        try {
            page = (int) session.getAttribute("nowPage");
        } catch (Exception ignored) {
        }

        paging.setPage(page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);

        int count = adminService.countAllNotice(paging);
        pagination.setArticleTotalCount(count);

        List<NoticeDto> noticeList = adminService.getAllNoticeListByPaging(paging);

        for (NoticeDto noticeDto : noticeList) {
            if (noticeDto.getContent().contains("<img")) {
                noticeDto.setContent("이미지 파일 포함");
            } else {
                noticeDto.setContent(noticeDto.getContent().replaceAll("<br>", ""));
            }
        }

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("pagination", pagination);

        return "/admin/noticeAdmin";
    }

    @GetMapping("/notice-detail")
    public String noticeDetail(@ModelAttribute("page") int page, @RequestParam("id") int id, Model model) {
        model.addAttribute("noticeDetail", adminService.getNoticeById(id));
        return "admin/noticeDetail";
    }

    @GetMapping("/notice-write")
    public String noticeWrite() {
        return "admin/noticeWrite";
    }

    @GetMapping("/notice-update")
    public String noticeUpdate(@RequestParam("id") int id, Model model) {
        model.addAttribute("noticeDetail", adminService.getNoticeById(id));
        return "admin/noticeUpdate";
    }

}