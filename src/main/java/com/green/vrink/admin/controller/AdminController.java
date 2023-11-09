package com.green.vrink.admin.controller;

import com.green.vrink.admin.dto.AdminAdDto;
import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.Pagination;
import com.green.vrink.admin.dto.PagingDto;
import com.green.vrink.admin.service.AdminService;
import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.community.service.FreeBoardReplyService;
import com.green.vrink.qna.service.QnAService;
import com.green.vrink.suggest.dto.AdminSuggestDto;
import com.green.vrink.suggest.dto.GetSuggestDto;
import com.green.vrink.suggest.dto.SuggestReplyDto;
import com.green.vrink.suggest.repository.model.Suggest;
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

        model.addAttribute("userSevenDate", adminService.getDateCountSevenDaysByTableName("user"));
        model.addAttribute("userWeekDate", adminService.getDateCountWeekByTableName("user"));
        model.addAttribute("userMonthDate", adminService.getDateCountMonthByTableName("user"));
        model.addAttribute("freeBoardSevenDate", adminService.getDateCountSevenDaysByTableName("community"));
        model.addAttribute("freeBoardWeekDate", adminService.getDateCountWeekByTableName("community"));
        model.addAttribute("freeBoardMonthDate", adminService.getDateCountMonthByTableName("community"));
        model.addAttribute("suggestSevenDate", adminService.getDateCountSevenDaysByTableName("suggest"));
        model.addAttribute("suggestWeekDate", adminService.getDateCountWeekByTableName("suggest"));
        model.addAttribute("suggestMonthDate", adminService.getDateCountMonthByTableName("suggest"));

        model.addAttribute("editorSevenDate", adminService.getEditorDateCountSevenDays());
        model.addAttribute("editorWeekDate", adminService.getEditorDateCountWeek());
        model.addAttribute("editorMonthDate", adminService.getEditorDateCountMonth());

        model.addAttribute("standardNum", adminService.countStandardUser());
        model.addAttribute("editorNum", adminService.countEditorUser());
        model.addAttribute("enabledNum", adminService.countEnabledUser());

        return "/admin/main";
    }

    @GetMapping("/test2")
    public String test(Model model) {
        String test1 = test.getTest();
        model.addAttribute("test", test1);

        return "test";
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
                          Model model) {

        log.info("의뢰게시판 목록 컨트롤러 호출");

        paging.setRecordSize(10);

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

        int count = adminService.countAllSuggest();
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
    public String suggestDetail(@ModelAttribute("page") int page, @RequestParam("id") int id, @RequestParam("nickname") String nickname, Model model) {

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
        model.addAttribute("next",next);
        model.addAttribute("replyCount", replyCount);

        return "admin/suggestDetail";
    }

    @GetMapping("/user")
    public String userAdmin(@ModelAttribute("paging") PagingDto paging,
                            @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                            @RequestParam(value = "classification2", required = false, defaultValue = "전체")
                            String classification2,
                            @RequestParam(value = "classification3", required = false, defaultValue = "전체")
                            String classification3,
                            @RequestParam(value = "searchType", required = false, defaultValue = "전체")
                            String searchType,
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
                          @RequestParam(value = "reset", required = false, defaultValue = "2") String reset,
                          Model model) {

        log.info("배너광고 목록 컨트롤러 호출");

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

        int count = adminService.countAllAd();
        pagination.setArticleTotalCount(count);

        List<AdminAdDto> adminAdList = adminService.getAllAdListByPaging(paging);

        model.addAttribute("adminAdList", adminAdList);
        model.addAttribute("pagination", pagination);

        return "/admin/adAdmin";
    }

    @GetMapping("/ad-admin/detail")
    public String adDetail(@ModelAttribute("page") int page, @RequestParam("id") int id, Model model) {
        model.addAttribute("adDetail", adminService.getAdById(id));

        log.info("asd" + adminService.getAdById(id));

        return "admin/adDetailAdmin";
    }

    @GetMapping("/ad-admin/write")
    public String adWrite() {
        return "admin/adWrite";
    }

}