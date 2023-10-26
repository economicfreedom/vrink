package com.green.vrink.admin.controller;

import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.Pagination;
import com.green.vrink.admin.dto.PagingDto;
import com.green.vrink.admin.service.AdminService;
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

    @GetMapping("/main")
    public String main(){
        return "/admin/main";
    }

    @GetMapping("/applyAccept")
    public String applyAccept(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
            required = false, defaultValue="1")int page, @RequestParam(value="classification",
            required = false, defaultValue="전체")String classification, @RequestParam(value="searchType",
            required = false, defaultValue="전체")String searchType, @RequestParam(value="keyword",
            required = false, defaultValue="")String keyword, @RequestParam(value="reset",
            required = false, defaultValue="2")String reset, Model model){

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

}