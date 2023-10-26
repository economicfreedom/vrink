package com.green.vrink.admin.controller;

import com.green.vrink.admin.dto.AdminApplyClassificationDto;
import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.Pagination;
import com.green.vrink.admin.dto.PagingDto;
import com.green.vrink.admin.service.AdminService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/admin")
@Slf4j
@RequiredArgsConstructor
public class AdminRestController {

    private final HttpSession session;
    private final AdminService adminService;
    @GetMapping("/classification")
    @ResponseBody
    public AdminApplyClassificationDto adminApplyClassification(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
            required = false, defaultValue="1")int page, @RequestParam(value="classification",
            required = false, defaultValue="전체")String classification, @RequestParam(value="searchType",
            required = false, defaultValue="전체")String searchType, @RequestParam(value="keyword",
            required = false, defaultValue="")String keyword) {

        log.info("판매자 신청 목록 컨트롤러 호출");

        paging.setPage(page);
        paging.setClassification(classification);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uClassification", classification);
        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        AdminApplyClassificationDto adminApplyClassificationDto = new AdminApplyClassificationDto();
        pagination.setArticleTotalCount(adminService.countAllAdminApply());

        //분류가 전체일 떄
        if(classification.equals("전체")) {

            List<AdminApplyDto> adminApplyDtoList = adminService.getAllAdminApplyListByPaging(paging);

            if(!keyword.equals("")) {

                List<AdminApplyDto> lastAdminApplyDtoList = new ArrayList<>();
                List<AdminApplyDto> finalAdminApplyDtoList = new ArrayList<>();

                adminApplyDtoList = adminService.getAllAdminApplyList();

                if(searchType.equals("은행이름")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if(adminApplyDto.getName().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else if(searchType.equals("계좌번호")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if(adminApplyDto.getNumber().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else if(searchType.equals("닉네임")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if(adminApplyDto.getNickname().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if(adminApplyDto.getName().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        } else if(adminApplyDto.getNumber().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        } else if(adminApplyDto.getNickname().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastAdminApplyDtoList.size());
                for (int i = (page-1)*10; i < Math.min((page-1)*10+10, lastAdminApplyDtoList.size()); i++) {
                    finalAdminApplyDtoList.add(lastAdminApplyDtoList.get(i));
                }
                adminApplyDtoList = finalAdminApplyDtoList;
            }

            adminApplyClassificationDto.setAdminApplyList(adminApplyDtoList);
            adminApplyClassificationDto.setPagination(pagination);

            return adminApplyClassificationDto;
        }
        //분류값이 있을 때
        else {

            List<AdminApplyDto> adminApplyDtoList = adminService.getAllAdminApplyListByTypePaging(paging);
            pagination.setArticleTotalCount(adminService.countAdminApplyByType(paging));

            if(!keyword.equals("")) {

                List<AdminApplyDto> lastAdminApplyDtoList = new ArrayList<>();
                List<AdminApplyDto> finalAdminApplyDtoList = new ArrayList<>();

                adminApplyDtoList = adminService.getAllAdminApplyListByType(classification);

                if(searchType.equals("은행이름")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if(adminApplyDto.getName().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else if(searchType.equals("계좌번호")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if(adminApplyDto.getNumber().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else if(searchType.equals("닉네임")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if(adminApplyDto.getNickname().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if(adminApplyDto.getName().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        } else if(adminApplyDto.getNumber().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        } else if(adminApplyDto.getNickname().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastAdminApplyDtoList.size());
                for (int i = (page-1)*10; i < Math.min((page-1)*10+10, lastAdminApplyDtoList.size()); i++) {
                    finalAdminApplyDtoList.add(lastAdminApplyDtoList.get(i));
                }
                adminApplyDtoList = finalAdminApplyDtoList;

            }

            paging.setClassification(classification);
            adminApplyClassificationDto.setAdminApplyList(adminApplyDtoList);
            adminApplyClassificationDto.setPagination(pagination);

            return adminApplyClassificationDto;
        }
    }

}
