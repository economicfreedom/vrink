package com.green.vrink.admin.controller;

import com.green.vrink.admin.dto.*;
import com.green.vrink.admin.service.AdminService;
import com.green.vrink.community.dto.FreeBoardDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/admin")
@Slf4j
@RequiredArgsConstructor
public class AdminRestController {

    private final HttpSession session;
    private final AdminService adminService;
    @GetMapping("/apply-accept/classification")
    @ResponseBody
    public ClassificationDto adminApplyClassification(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
            required = false, defaultValue="1")int page, @RequestParam(value="classification",
            required = false, defaultValue="전체")String classification, @RequestParam(value="searchType",
            required = false, defaultValue="전체")String searchType, @RequestParam(value="keyword",
            required = false, defaultValue="")String keyword) {

        log.info("판매자 신청 목록 레스트 컨트롤러 호출");

        paging.setPage(page);
        paging.setClassification(classification);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uClassification", classification);
        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        ClassificationDto classificationDto = new ClassificationDto();
        pagination.setArticleTotalCount(adminService.countAllAdminApply());

        //분류가 전체일 떄
        if(classification.equals("전체")) {

            log.info("판매자 신청 목록 카테고리 & 검색어 레스트 컨트롤러 호출");
            
            List<AdminApplyDto> adminApplyDtoList = adminService.getAllAdminApplyListByPaging(paging);

            if(!keyword.equals("")) {

                log.info("키워드 : 전체");

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
                } else if(searchType.equals("사기이력")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if(adminApplyDto.getCheater().contains(keyword)) {
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
                        } else if(adminApplyDto.getCheater().contains(keyword)) {
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

            classificationDto.setAdminApplyList(adminApplyDtoList);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }
        //분류값이 있을 때
        else {

            List<AdminApplyDto> adminApplyDtoList = adminService.getAllAdminApplyListByTypePaging(paging);
            pagination.setArticleTotalCount(adminService.countAdminApplyByType(paging));

            if(!keyword.equals("")) {

                log.info("키워드 : " + keyword);

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
                } else if(searchType.equals("사기이력")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if(adminApplyDto.getCheater().contains(keyword)) {
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
                        } else if(adminApplyDto.getCheater().contains(keyword)) {
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
            classificationDto.setAdminApplyList(adminApplyDtoList);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }
    }

    @GetMapping("/freeboard/classification")
    @ResponseBody
    public ClassificationDto adminApplyClassification(@ModelAttribute("paging") PagingDto paging , @RequestParam(value="page",
            required = false, defaultValue="1")int page, @RequestParam(value="searchType",
            required = false, defaultValue="전체")String searchType, @RequestParam(value="keyword",
            required = false, defaultValue="")String keyword) {

        log.info("자유게시판 관리 목록 레스트 컨트롤러 호출");

        paging.setPage(page);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        ClassificationDto classificationDto = new ClassificationDto();
        pagination.setArticleTotalCount(adminService.countAllFreeboard());

            log.info("자유게시판 검색어 레스트 컨트롤러 호출");

            List<FreeBoardDTO> freeBoradDto = adminService.getAllFreeboardListByPaging(paging);

            if(!keyword.equals("")) {

                log.info("키워드 : 전체");

                List<FreeBoardDTO> lastFreeBoardDTOList = new ArrayList<>();
                List<FreeBoardDTO> finalFreeBoardDTOList = new ArrayList<>();

                freeBoradDto = adminService.getAllFreeboardList();

                if(searchType.equals("아이디")) {
                    for (FreeBoardDTO adminApplyDto : freeBoradDto) {
                        if(adminApplyDto.getNickname().contains(keyword)) {
                            lastFreeBoardDTOList.add(adminApplyDto);
                        }
                    }
                } else if(searchType.equals("제목")) {
                    for (FreeBoardDTO adminApplyDto : freeBoradDto) {
                        if(adminApplyDto.getTitle().contains(keyword)) {
                            lastFreeBoardDTOList.add(adminApplyDto);
                        }
                    }
                } else if(searchType.equals("내용")) {
                    for (FreeBoardDTO adminApplyDto : freeBoradDto) {
                        if(adminApplyDto.getContent().contains(keyword)) {
                            lastFreeBoardDTOList.add(adminApplyDto);
                        }
                    }
                } else {
                    for (FreeBoardDTO adminApplyDto : freeBoradDto) {
                        if(adminApplyDto.getNickname().contains(keyword)) {
                            lastFreeBoardDTOList.add(adminApplyDto);
                        } else if(adminApplyDto.getTitle().contains(keyword)) {
                            lastFreeBoardDTOList.add(adminApplyDto);
                        } else if(adminApplyDto.getContent().contains(keyword)) {
                            lastFreeBoardDTOList.add(adminApplyDto);
                        } else if(adminApplyDto.getCreatedAt().contains(keyword)) {
                            lastFreeBoardDTOList.add(adminApplyDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastFreeBoardDTOList.size());
                for (int i = (page-1)*10; i < Math.min((page-1)*10+10, lastFreeBoardDTOList.size()); i++) {
                    finalFreeBoardDTOList.add(lastFreeBoardDTOList.get(i));
                }
                freeBoradDto = finalFreeBoardDTOList;
            }

            classificationDto.setFreeboardList(freeBoradDto);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }

    @Transactional
    @PostMapping("/change-apply")
    public ResponseEntity<Integer> changeApply(@RequestParam("applyId") Integer applyId, @RequestParam("accepted") Integer accepted, @RequestParam("number") String number) throws IOException {

        log.info("승인 상태 변경 컨트롤러 실행");

        if(accepted == 1) {

            //승인에서 비승인으로 바꿀 때

            log.info("승인 상태이므로 비승인 상태로 변경");

            accepted = 0;
            adminService.changeApply(applyId, accepted);
            adminService.changeCheater(applyId, "이력 없음");
            return ResponseEntity.status(HttpStatus.OK).body(200);
        }
        else {

            //비승인에서 승인으로 바꿀 때

            log.info("비승인 상태이므로 승인 상태로 변경");

            if(!adminService.getCheatCheckList(number)) {
                log.info("중고나라 사기 조회 크롤링 실행 결과 : 사기꾼 아님");
                accepted = 1;
                adminService.changeApply(applyId, accepted);
                adminService.changeCheater(applyId, "이력 없음");
                return ResponseEntity.status(HttpStatus.OK).body(200);
            } else {
                log.info("중고나라 사기 조회 크롤링 실행 결과 : 사기꾼임");
                adminService.changeCheater(applyId, "사기 이력");
                return ResponseEntity.status(HttpStatus.OK).body(400);
            }
        }
    }
}