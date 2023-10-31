package com.green.vrink.admin.controller;

import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.Pagination;
import com.green.vrink.admin.dto.PagingDto;
import com.green.vrink.admin.service.AdminService;
import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.community.service.FreeBoardReplyService;
import com.green.vrink.message.service.MessageService;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.PageDTO;
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

    private final MessageService messageService;

    @GetMapping("/main")
    public String main(){
        log.info("관리자 페이지 메인 컨트롤러 실행");
        return "/admin/main";
    }

    @GetMapping("/apply-accept")
    public String applyAccept(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
            required = false, defaultValue="1")int page, @RequestParam(value="classification",
            required = false, defaultValue="전체")String classification, @RequestParam(value="searchType",
            required = false, defaultValue="전체")String searchType, @RequestParam(value="keyword",
            required = false, defaultValue="")String keyword, @RequestParam(value="reset",
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
            required = false, defaultValue="1")int page, @RequestParam(value="searchType",
            required = false, defaultValue="전체")String searchType, @RequestParam(value="keyword",
            required = false, defaultValue="")String keyword, @RequestParam(value="reset",
            required = false, defaultValue="2")String reset, Model model){

        log.info("자유게시판 목록 컨트롤러 호출");

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
    public String userDetail(@ModelAttribute("page") int page, @RequestParam("id") int id, Model model) {

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
            required = false, defaultValue="1")int page, @RequestParam(value="classification",
            required = false, defaultValue="전체")String classification,
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
        Pagination pagination = new Pagination();
        pagination.setPaging(paging);

        int count = adminService.userTotalCount();
        pagination.setArticleTotalCount(count);

        model.addAttribute("userList", adminService.getAllUserPaging(paging));
        model.addAttribute("pagination", pagination);

        return "admin/userListAdmin";
    }

}