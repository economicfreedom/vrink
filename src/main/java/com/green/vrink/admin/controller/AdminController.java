package com.green.vrink.admin.controller;

import com.green.vrink.admin.dto.AdminAdDto;
import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.Pagination;
import com.green.vrink.admin.dto.PagingDto;
import com.green.vrink.admin.service.AdminService;
import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.community.service.FreeBoardReplyService;
import com.green.vrink.message.service.MessageService;
import com.green.vrink.qna.service.QnAService;
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

    private final Test test;

    @GetMapping("/main")
    @AdminCheck
    public String main(){
        log.info("관리자 페이지 메인 컨트롤러 실행");
        return "/admin/main";
    }

    @GetMapping("/test2")
    public String test(Model model){
        String test1 = test.getTest();
        model.addAttribute("test",test1);

        return "test";
    }
    @GetMapping("/apply-accept")
    public String applyAccept(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
            required = false, defaultValue="1")int page, @RequestParam(value="reset",
            required = false, defaultValue="2")String reset, Model model){

        log.info("판매자 신청 목록 컨트롤러 호출");

        if(reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
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
    public String freeBoard(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
            required = false, defaultValue="1")int page, @RequestParam(value="reset",
            required = false, defaultValue="2")String reset, Model model){

        log.info("자유게시판 목록 컨트롤러 호출");

        paging.setRecordSize(10);

        if(reset.equals("1")) {
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
        }

        paging.setPage(page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);

        int count = adminService.countAllAdminApply();
        pagination.setArticleTotalCount(count);

        List<FreeBoardDTO> freeBoardDTOList = adminService.getAllFreeboardListByPaging(paging);

        for (FreeBoardDTO freeBoradDto : freeBoardDTOList) {
            if(freeBoradDto.getContent().contains("<img")) {
                freeBoradDto.setContent("이미지 파일 포함");
            } else {
                freeBoradDto.setContent(freeBoradDto.getContent().replaceAll("<br>", ""));
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

        List<FreeBoardReplyDTO> freeBoardReplyDTOS = freeBoardReplyService.readList(freeBoardDTO.getCommunityId(),cri);
        log.info(pageDTO.toString());
        log.info("total : {}",total);
        boolean next = pageDTO.getEndPage() > 1;

        model.addAttribute("list",freeBoardReplyDTOS);
        model.addAttribute("dto", freeBoardDTO);
        model.addAttribute("next",next);
        model.addAttribute("total",total);

        return "admin/freeboardDetail";
    }

    @GetMapping("/user")
    public String userAdmin(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
            required = false, defaultValue="1")int page,
                            @RequestParam(value="classification2", required = false, defaultValue="전체")String classification2,
            @RequestParam(value="classification3", required = false, defaultValue="전체")String classification3, @RequestParam(value="searchType",
            required = false, defaultValue="전체")String searchType, @RequestParam(value="keyword",
            required = false, defaultValue="")String keyword, @RequestParam(value="reset",
            required = false, defaultValue="2")String reset, Model model) {

        log.info("유저 관리 페이지 컨트롤러 호출");

        if(reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uClassification2");
            session.removeAttribute("uClassification3");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
        }

        paging.setPage(page);
        if(classification2.equals("전체")) paging.setClassification2("3");
        else paging.setClassification2(classification2);
        if(classification3.equals("전체")) paging.setClassification3("3");
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
    public String questionAdmin(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
            required = false, defaultValue="1")int page, @RequestParam(value="classification2",
            required = false, defaultValue="전체")String classification2, @RequestParam(value="reset",
            required = false, defaultValue="2")String reset, Model model) {

        log.info("문의 관리 페이지 컨트롤러 호출");

        if(classification2.equals("전체")) paging.setClassification2("3");
        else paging.setClassification2(classification2);

        if(reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uClassification2");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
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
    public String adAdmin(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
            required = false, defaultValue="1")int page, @RequestParam(value="reset",
            required = false, defaultValue="2")String reset, Model model){

        log.info("배너광고 목록 컨트롤러 호출");

        if(reset.equals("1")) {
            session.removeAttribute("uClassification");
            session.removeAttribute("uSearchType");
            session.removeAttribute("uKeyword");
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

        return "admin/adDetailAdmin";
    }

}