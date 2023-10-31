package com.green.vrink.admin.controller;

import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.ClassificationDto;
import com.green.vrink.admin.dto.Pagination;
import com.green.vrink.admin.dto.PagingDto;
import com.green.vrink.admin.service.AdminService;
import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.service.FreeBoardReplyService;
import com.green.vrink.community.service.FreeBoardService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.LoginCheck;
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
    private final FreeBoardReplyService freeBoardReplyService;
    private final FreeBoardService freeBoardService;
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

            if(!keyword.isEmpty()) {

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

            if(!keyword.isEmpty()) {

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

            List<FreeBoardDTO> freeBoradDtoList = adminService.getAllFreeboardListByPaging(paging);

            if(!keyword.isEmpty()) {

                List<FreeBoardDTO> lastFreeBoardDTOList = new ArrayList<>();
                List<FreeBoardDTO> finalFreeBoardDTOList = new ArrayList<>();

                freeBoradDtoList = adminService.getAllFreeboardList();

                if(searchType.equals("아이디")) {
                    for (FreeBoardDTO freeBoradDto : freeBoradDtoList) {
                        if(freeBoradDto.getNickname().contains(keyword)) {
                            lastFreeBoardDTOList.add(freeBoradDto);
                        }
                    }
                } else if(searchType.equals("제목")) {
                    for (FreeBoardDTO freeBoradDto : freeBoradDtoList) {
                        if(freeBoradDto.getTitle().contains(keyword)) {
                            lastFreeBoardDTOList.add(freeBoradDto);
                        }
                    }
                } else if(searchType.equals("내용")) {
                    for (FreeBoardDTO freeBoradDto : freeBoradDtoList) {
                        if(freeBoradDto.getContent().contains(keyword)) {
                            lastFreeBoardDTOList.add(freeBoradDto);
                        }
                    }
                } else {
                    for (FreeBoardDTO freeBoradDto : freeBoradDtoList) {
                        if(freeBoradDto.getNickname().contains(keyword)) {
                            lastFreeBoardDTOList.add(freeBoradDto);
                        } else if(freeBoradDto.getTitle().contains(keyword)) {
                            lastFreeBoardDTOList.add(freeBoradDto);
                        } else if(freeBoradDto.getContent().contains(keyword)) {
                            lastFreeBoardDTOList.add(freeBoradDto);
                        } else if(freeBoradDto.getCreatedAt().contains(keyword)) {
                            lastFreeBoardDTOList.add(freeBoradDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastFreeBoardDTOList.size());
                for (int i = (page-1)*10; i < Math.min((page-1)*10+10, lastFreeBoardDTOList.size()); i++) {
                    finalFreeBoardDTOList.add(lastFreeBoardDTOList.get(i));
                }
                freeBoradDtoList = finalFreeBoardDTOList;

            }

            for (FreeBoardDTO freeBoradDto : freeBoradDtoList) {
                if(freeBoradDto.getContent().contains("<img")) {
                    freeBoradDto.setContent("이미지 파일 포함");
                } else {
                    freeBoradDto.setContent(freeBoradDto.getContent().replaceAll("<br>", " "));
                }
            }

            classificationDto.setFreeboardList(freeBoradDtoList);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }

    @DeleteMapping("/free-replay/del/{reply-id}")
    @LoginCheck
    public ResponseEntity<?> del(
            @PathVariable(name = "reply-id")
            Integer replyId
    ) {
        if (replyId == null) {
            return ResponseEntity.badRequest().build();
        }

        User user = (User) session.getAttribute("USER");
        int sessionUserId = user.getUserId();
        log.info("sessionId" + sessionUserId);

        if (sessionUserId == 1) {
            freeBoardReplyService.delete(replyId);
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.badRequest().build();
    }

    @DeleteMapping("/del/{community-id}")
    @LoginCheck
    public ResponseEntity<?> delete(
            @PathVariable("community-id")
            Integer communityId
    ) {
        User user = (User) session.getAttribute("USER");
        int sessionUserId = user.getUserId();
        if (sessionUserId != 1) {
            return ResponseEntity.badRequest().build();
        }
        freeBoardService.delete(communityId);
        return ResponseEntity.ok().build();
    }


    @GetMapping("/user/classification")
    @ResponseBody
    public ClassificationDto userClassification(@ModelAttribute("paging") PagingDto paging,
            @RequestParam(value="page", required = false, defaultValue="1")int page,
            @RequestParam(value="classification", required = false, defaultValue="전체")String classification,
            @RequestParam(value="classification2", required = false, defaultValue="전체")String classification2,
            @RequestParam(value="classification3", required = false, defaultValue="전체")String classification3,
            @RequestParam(value="searchType", required = false, defaultValue="전체")String searchType,
            @RequestParam(value="keyword", required = false, defaultValue="")String keyword) {

        log.info("관리자 유저 목록 레스트 컨트롤러 호출");

        paging.setPage(page);
        paging.setClassification(classification);
        paging.setClassification2(classification2);
        paging.setClassification3(classification3);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uClassification", classification);
        session.setAttribute("uClassification2", classification2);
        session.setAttribute("uClassification3", classification3);
        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        ClassificationDto classificationDto = new ClassificationDto();
        pagination.setArticleTotalCount(adminService.userTotalCount());
        //분류가 전체일 떄
        if(classification.equals("전체")) {

            List<User> userList = adminService.getAllUserPaging(paging);

            if(!keyword.isEmpty()) {

                List<User> lastUserList = new ArrayList<>();
                List<User> finalUserList = new ArrayList<>();

                userList = adminService.getAllUser();
                if(searchType.equals("이메일")) {
                    for (User userDto : userList) {
                        if(userDto.getEmail().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("아이디")) {
                    for (User userDto : userList) {
                        if(userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("이름")) {
                    for (User userDto : userList) {
                        if(userDto.getName().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("닉네임")) {
                    for (User userDto : userList) {
                        if(userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("전화번호")) {
                    for (User userDto : userList) {
                        if(userDto.getPhone().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("은행이름")) {
                    for (User userDto : userList) {
                        if(userDto.getAccount().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("포인트")) {
                    for (User userDto : userList) {
                        if(userDto.getPoint().toString().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else {
                    for (User userDto : userList) {
                        if(userDto.getEmail().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getName().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getPhone().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getAccount().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getPoint().toString().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastUserList.size());
                for (int i = (page-1)*10; i < Math.min((page-1)*10+10, lastUserList.size()); i++) {
                    finalUserList.add(lastUserList.get(i));
                }
                userList = finalUserList;
            }

            classificationDto.setUserList(userList);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }
        //분류값이 있을 때
        else {

            List<User> userList = adminService.getAllUserByTypePaging(paging);
            pagination.setArticleTotalCount(adminService.userTotalCountClassification(paging));

            if(!keyword.isEmpty()) {

                List<User> lastUserList = new ArrayList<>();
                List<User> finalUserList = new ArrayList<>();

                userList = adminService.getAllUserByType(classification);

                if(searchType.equals("이메일")) {
                    for (User userDto : userList) {
                        if(userDto.getEmail().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("아이디")) {
                    for (User userDto : userList) {
                        if(userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("이름")) {
                    for (User userDto : userList) {
                        if(userDto.getName().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("닉네임")) {
                    for (User userDto : userList) {
                        if(userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("전화번호")) {
                    for (User userDto : userList) {
                        if(userDto.getPhone().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("은행이름")) {
                    for (User userDto : userList) {
                        if(userDto.getAccount().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if(searchType.equals("포인트")) {
                    for (User userDto : userList) {
                        if(userDto.getPoint().toString().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else {
                    for (User userDto : userList) {
                        if(userDto.getEmail().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getName().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getPhone().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getAccount().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if(userDto.getPoint().toString().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastUserList.size());
                for (int i = (page-1)*10; i < Math.min((page-1)*10+10, lastUserList.size()); i++) {
                    finalUserList.add(lastUserList.get(i));
                }
                userList = finalUserList;

            }

            paging.setClassification(classification);
            classificationDto.setUserList(userList);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }
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