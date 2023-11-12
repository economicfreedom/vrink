package com.green.vrink.admin.controller;

import com.green.vrink.admin.dto.*;
import com.green.vrink.admin.service.AdminService;
import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.service.FreeBoardReplyService;
import com.green.vrink.community.service.FreeBoardService;
import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.suggest.dto.AdminSuggestDto;
import com.green.vrink.suggest.service.SuggestService;
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
    private final SuggestService suggestService;

    @GetMapping("/apply-accept/classification")
    @ResponseBody
    public ClassificationDto adminApplyClassification(@ModelAttribute("paging") PagingDto paging, @RequestParam(value = "page",
            required = false, defaultValue = "1") int page, @RequestParam(value = "classification",
            required = false, defaultValue = "전체") String classification, @RequestParam(value = "searchType",
            required = false, defaultValue = "전체") String searchType, @RequestParam(value = "keyword",
            required = false, defaultValue = "") String keyword) {

        log.info("판매자 신청 목록 레스트 컨트롤러 실행");

        paging.setPage(page);
        paging.setClassification(classification);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uClassification", classification);
        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);
        session.setAttribute("nowPage", page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        ClassificationDto classificationDto = new ClassificationDto();
        pagination.setArticleTotalCount(adminService.countAllAdminApply());

        //분류가 전체일 떄
        if (classification.equals("전체")) {

            List<AdminApplyDto> adminApplyDtoList = adminService.getAllAdminApplyListByPaging(paging);

            if (!keyword.isEmpty()) {

                log.info("키워드 : 전체");

                List<AdminApplyDto> lastAdminApplyDtoList = new ArrayList<>();
                List<AdminApplyDto> finalAdminApplyDtoList = new ArrayList<>();

                adminApplyDtoList = adminService.getAllAdminApplyList();

                if (searchType.equals("은행이름")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if (adminApplyDto.getName().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else if (searchType.equals("계좌번호")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if (adminApplyDto.getNumber().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else if (searchType.equals("닉네임")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if (adminApplyDto.getNickname().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else if (searchType.equals("사기이력")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if (adminApplyDto.getCheater().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if (adminApplyDto.getName().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        } else if (adminApplyDto.getNumber().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        } else if (adminApplyDto.getNickname().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        } else if (adminApplyDto.getCheater().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastAdminApplyDtoList.size());
                for (int i = (page - 1) * 10; i < Math.min((page - 1) * 10 + 10, lastAdminApplyDtoList.size()); i++) {
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

            if (!keyword.isEmpty()) {

                log.info("키워드 : " + keyword);

                List<AdminApplyDto> lastAdminApplyDtoList = new ArrayList<>();
                List<AdminApplyDto> finalAdminApplyDtoList = new ArrayList<>();

                adminApplyDtoList = adminService.getAllAdminApplyListByType(classification);

                if (searchType.equals("은행이름")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if (adminApplyDto.getName().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else if (searchType.equals("계좌번호")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if (adminApplyDto.getNumber().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else if (searchType.equals("닉네임")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if (adminApplyDto.getNickname().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else if (searchType.equals("사기이력")) {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if (adminApplyDto.getCheater().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                } else {
                    for (AdminApplyDto adminApplyDto : adminApplyDtoList) {
                        if (adminApplyDto.getName().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        } else if (adminApplyDto.getNumber().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        } else if (adminApplyDto.getNickname().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        } else if (adminApplyDto.getCheater().contains(keyword)) {
                            lastAdminApplyDtoList.add(adminApplyDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastAdminApplyDtoList.size());
                for (int i = (page - 1) * 10; i < Math.min((page - 1) * 10 + 10, lastAdminApplyDtoList.size()); i++) {
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
    public ClassificationDto freeboardClassification(@ModelAttribute("paging") PagingDto paging, @RequestParam(value = "page",
            required = false, defaultValue = "1") int page, @RequestParam(value = "searchType",
            required = false, defaultValue = "전체") String searchType, @RequestParam(value = "keyword",
            required = false, defaultValue = "") String keyword) {

        log.info("자유게시판 관리 목록 레스트 컨트롤러 실행");

        paging.setRecordSize(20);

        paging.setPage(page);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);
        session.setAttribute("nowPage", page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        ClassificationDto classificationDto = new ClassificationDto();
        pagination.setArticleTotalCount(adminService.countAllFreeboard());

        List<FreeBoardDTO> freeBoradDtoList = adminService.getAllFreeboardListByPaging(paging);

        if (!keyword.isEmpty()) {

            List<FreeBoardDTO> lastFreeBoardDTOList = new ArrayList<>();
            List<FreeBoardDTO> finalFreeBoardDTOList = new ArrayList<>();

            freeBoradDtoList = adminService.getAllFreeboardList();

            if (searchType.equals("아이디")) {
                for (FreeBoardDTO freeBoradDto : freeBoradDtoList) {
                    if (freeBoradDto.getNickname().contains(keyword)) {
                        lastFreeBoardDTOList.add(freeBoradDto);
                    }
                }
            } else if (searchType.equals("제목")) {
                for (FreeBoardDTO freeBoradDto : freeBoradDtoList) {
                    if (freeBoradDto.getTitle().contains(keyword)) {
                        lastFreeBoardDTOList.add(freeBoradDto);
                    }
                }
            } else if (searchType.equals("내용")) {
                for (FreeBoardDTO freeBoradDto : freeBoradDtoList) {
                    if (freeBoradDto.getContent().contains(keyword)) {
                        lastFreeBoardDTOList.add(freeBoradDto);
                    }
                }
            } else {
                for (FreeBoardDTO freeBoradDto : freeBoradDtoList) {
                    if (freeBoradDto.getNickname().contains(keyword)) {
                        lastFreeBoardDTOList.add(freeBoradDto);
                    } else if (freeBoradDto.getTitle().contains(keyword)) {
                        lastFreeBoardDTOList.add(freeBoradDto);
                    } else if (freeBoradDto.getContent().contains(keyword)) {
                        lastFreeBoardDTOList.add(freeBoradDto);
                    } else if (freeBoradDto.getCreatedAt().contains(keyword)) {
                        lastFreeBoardDTOList.add(freeBoradDto);
                    }
                }
            }

            pagination.setArticleTotalCount(lastFreeBoardDTOList.size());
            for (int i = (page - 1) * 20; i < Math.min((page - 1) * 20 + 20, lastFreeBoardDTOList.size()); i++) {
                finalFreeBoardDTOList.add(lastFreeBoardDTOList.get(i));
            }
            freeBoradDtoList = finalFreeBoardDTOList;

        }

        for (FreeBoardDTO freeBoradDto : freeBoradDtoList) {
            if (freeBoradDto.getContent().contains("<img")) {
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

        if (sessionUserId == 0) {
            freeBoardReplyService.delete(replyId);
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.badRequest().build();
    }

    @GetMapping("/suggest/classification")
    @ResponseBody
    public ClassificationDto suggestClassification(@ModelAttribute("paging") PagingDto paging, @RequestParam(value = "page",
            required = false, defaultValue = "1") int page, @RequestParam(value = "searchType",
            required = false, defaultValue = "전체") String searchType, @RequestParam(value = "keyword",
            required = false, defaultValue = "") String keyword, @RequestParam(value = "classification", required = false, defaultValue = "전체") String classification) {

        log.info("의뢰게시판 관리 목록 레스트 컨트롤러 실행");

        paging.setRecordSize(20);

        if (classification.equals("전체")) paging.setClassification("3");
        else paging.setClassification(classification);

        paging.setPage(page);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uClassification", classification);
        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);
        session.setAttribute("nowPage", page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        ClassificationDto classificationDto = new ClassificationDto();
        pagination.setArticleTotalCount(adminService.countAllSuggest(paging));

        List<AdminSuggestDto> suggestDtoList = adminService.getAllSuggestListByPaging(paging);

        if (!keyword.isEmpty()) {

            List<AdminSuggestDto> lastAdminSuggestDtoList = new ArrayList<>();
            List<AdminSuggestDto> finalAdminSuggestDtoList = new ArrayList<>();

            suggestDtoList = adminService.getAllSuggestList(paging);

            if (searchType.equals("아이디")) {
                for (AdminSuggestDto suggestDto : suggestDtoList) {
                    if (suggestDto.getNickname().contains(keyword)) {
                        lastAdminSuggestDtoList.add(suggestDto);
                    }
                }
            } else if (searchType.equals("제목")) {
                for (AdminSuggestDto suggestDto : suggestDtoList) {
                    if (suggestDto.getTitle().contains(keyword)) {
                        lastAdminSuggestDtoList.add(suggestDto);
                    }
                }
            } else if (searchType.equals("내용")) {
                for (AdminSuggestDto suggestDto : suggestDtoList) {
                    if (suggestDto.getContent().contains(keyword)) {
                        lastAdminSuggestDtoList.add(suggestDto);
                    }
                }
            } else {
                for (AdminSuggestDto suggestDto : suggestDtoList) {
                    if (suggestDto.getNickname().contains(keyword)) {
                        lastAdminSuggestDtoList.add(suggestDto);
                    } else if (suggestDto.getTitle().contains(keyword)) {
                        lastAdminSuggestDtoList.add(suggestDto);
                    } else if (suggestDto.getContent().contains(keyword)) {
                        lastAdminSuggestDtoList.add(suggestDto);
                    } else if (suggestDto.getCreatedAt().contains(keyword)) {
                        lastAdminSuggestDtoList.add(suggestDto);
                    }
                }
            }

            pagination.setArticleTotalCount(lastAdminSuggestDtoList.size());
            for (int i = (page - 1) * 20; i < Math.min((page - 1) * 20 + 20, lastAdminSuggestDtoList.size()); i++) {
                finalAdminSuggestDtoList.add(lastAdminSuggestDtoList.get(i));
            }
            suggestDtoList = finalAdminSuggestDtoList;

        }

        for (AdminSuggestDto suggestDto : suggestDtoList) {
            if (suggestDto.getContent().contains("<img")) {
                suggestDto.setContent("이미지 파일 포함");
            } else {
                suggestDto.setContent(suggestDto.getContent().replaceAll("<br>", " "));
            }
        }

        classificationDto.setSuggestList(suggestDtoList);
        classificationDto.setPagination(pagination);

        return classificationDto;
    }

    @DeleteMapping("/del/{community-id}")
    @LoginCheck
    public ResponseEntity<?> deleteFreeBoard(
            @PathVariable("community-id")
            Integer communityId
    ) {
        User user = (User) session.getAttribute("USER");
        int sessionUserId = user.getUserId();
        if (sessionUserId != 0) {
            return ResponseEntity.badRequest().build();
        }
        freeBoardService.delete(communityId);
        return ResponseEntity.ok().build();
    }


    @DeleteMapping("/suggest/del/{suggest-id}")
    @LoginCheck
    public ResponseEntity<?> deleteSuggest(
            @PathVariable("suggest-id")
            Integer suggestId
    ) {

        log.info("의뢰게시판 게시글 삭제 레스트 컨트롤러 실행");

        User user = (User) session.getAttribute("USER");
        int sessionUserId = user.getUserId();
        if (sessionUserId != 0) {
            return ResponseEntity.badRequest().build();
        }
        suggestService.deleteSuggest(suggestId);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/suggest-reply/del/{reply-id}")
    @LoginCheck
    public ResponseEntity<?> delSuggestReply(
            @PathVariable(name = "reply-id")
            Integer replyId
    ) {

        log.info("의뢰게시판 댓글 삭제 레스트 컨트롤러 실행");

        if (replyId == null) {
            return ResponseEntity.badRequest().build();
        }

        User user = (User) session.getAttribute("USER");
        int sessionUserId = user.getUserId();
        log.info("sessionId" + sessionUserId);

        if (sessionUserId == 0) {
            suggestService.deleteSuggestReply(replyId);
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.badRequest().build();
    }

    @GetMapping("/user/classification")
    @ResponseBody
    public ClassificationDto userClassification(@ModelAttribute("paging") PagingDto paging,
                                                @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                                                @RequestParam(value = "classification", required = false, defaultValue = "전체") String classification,
                                                @RequestParam(value = "classification2", required = false, defaultValue = "전체") String classification2,
                                                @RequestParam(value = "classification3", required = false, defaultValue = "전체") String classification3,
                                                @RequestParam(value = "searchType", required = false, defaultValue = "전체") String searchType,
                                                @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

        log.info("관리자 유저 목록 레스트 컨트롤러 실행");

        paging.setPage(page);
        paging.setClassification(classification);
        if (classification2.equals("전체")) paging.setClassification2("3");
        else paging.setClassification2(classification2);
        if (classification3.equals("전체")) paging.setClassification3("3");
        else paging.setClassification3(classification3);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uClassification", classification);
        session.setAttribute("uClassification2", classification2);
        session.setAttribute("uClassification3", classification3);
        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);
        session.setAttribute("nowPage", page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        ClassificationDto classificationDto = new ClassificationDto();
        pagination.setArticleTotalCount(adminService.userTotalCount(paging));
        //분류가 전체일 떄
        if (classification.equals("전체")) {

            List<User> userList = adminService.getAllUserPaging(paging);

            if (!keyword.isEmpty()) {

                List<User> lastUserList = new ArrayList<>();
                List<User> finalUserList = new ArrayList<>();

                userList = adminService.getAllUser(paging);
                if (searchType.equals("이메일")) {
                    for (User userDto : userList) {
                        if (userDto.getEmail().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if (searchType.equals("아이디")) {
                    for (User userDto : userList) {
                        if (userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if (searchType.equals("이름")) {
                    for (User userDto : userList) {
                        if (userDto.getName().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if (searchType.equals("전화번호")) {
                    for (User userDto : userList) {
                        if (userDto.getPhone().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else {
                    for (User userDto : userList) {
                        if (userDto.getEmail().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if (userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if (userDto.getName().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if (userDto.getPhone().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastUserList.size());
                for (int i = (page - 1) * 10; i < Math.min((page - 1) * 10 + 10, lastUserList.size()); i++) {
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

            if (!keyword.isEmpty()) {

                List<User> lastUserList = new ArrayList<>();
                List<User> finalUserList = new ArrayList<>();

                userList = adminService.getAllUserByType(classification);

                if (searchType.equals("이메일")) {
                    for (User userDto : userList) {
                        if (userDto.getEmail().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if (searchType.equals("아이디")) {
                    for (User userDto : userList) {
                        if (userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if (searchType.equals("이름")) {
                    for (User userDto : userList) {
                        if (userDto.getName().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else if (searchType.equals("전화번호")) {
                    for (User userDto : userList) {
                        if (userDto.getPhone().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                } else {
                    for (User userDto : userList) {
                        if (userDto.getEmail().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if (userDto.getNickname().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if (userDto.getName().contains(keyword)) {
                            lastUserList.add(userDto);
                        } else if (userDto.getPhone().contains(keyword)) {
                            lastUserList.add(userDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastUserList.size());
                for (int i = (page - 1) * 10; i < Math.min((page - 1) * 10 + 10, lastUserList.size()); i++) {
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
    @PostMapping("/user/modify-level")
    public ResponseEntity<Integer> updateUserLevelById(User user) {

        log.info("관리자 회원정보 권한 수정 레스트 컨트롤러 실행");

        log.info("user : " + user);

        adminService.updateUserLevelById(user);

        return ResponseEntity.status(HttpStatus.OK).body(200);
    }

    @Transactional
    @PostMapping("/user/modify-able")
    public ResponseEntity<Integer> updateUserEnabledCheckById(User user) {

        log.info("관리자 회원정보 탈퇴처리 수정 레스트 컨트롤러 실행");

        log.info("user : " + user);

        adminService.updateUserEnabledCheckById(user);

        return ResponseEntity.status(HttpStatus.OK).body(200);
    }

    @GetMapping("/question/classification")
    @ResponseBody
    public ClassificationDto questionClassification(@ModelAttribute("paging") PagingDto paging,
                                                    @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                                                    @RequestParam(value = "classification", required = false, defaultValue = "전체") String classification,
                                                    @RequestParam(value = "classification2", required = false, defaultValue = "전체") String classification2,
                                                    @RequestParam(value = "searchType", required = false, defaultValue = "전체") String searchType,
                                                    @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

        log.info("관리자 문의 목록 레스트 컨트롤러 실행");

        paging.setPage(page);
        paging.setClassification(classification);
        if (classification2.equals("전체")) paging.setClassification2("3");
        else paging.setClassification2(classification2);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uClassification", classification);
        session.setAttribute("uClassification2", classification2);
        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);
        session.setAttribute("nowPage", page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        ClassificationDto classificationDto = new ClassificationDto();
        pagination.setArticleTotalCount(adminService.questionTotalCount(paging));
        //분류가 전체일 떄
        if (classification.equals("전체")) {

            List<QuestionDTO> questionList = adminService.getAllQuestionPaging(paging);

            if (!keyword.isEmpty()) {

                List<QuestionDTO> lastQuestionList = new ArrayList<>();
                List<QuestionDTO> finalQuestionList = new ArrayList<>();

                questionList = adminService.getAllQuestion(paging);
                if (searchType.equals("아이디")) {
                    for (QuestionDTO questionDto : questionList) {
                        if (questionDto.getNickname().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        }
                    }
                } else if (searchType.equals("이메일")) {
                    for (QuestionDTO questionDto : questionList) {
                        if (questionDto.getEmail().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        }
                    }
                } else if (searchType.equals("제목")) {
                    for (QuestionDTO questionDto : questionList) {
                        if (questionDto.getTitle().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        }
                    }
                } else if (searchType.equals("내용")) {
                    for (QuestionDTO questionDto : questionList) {
                        if (questionDto.getContent().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        }
                    }
                } else {
                    for (QuestionDTO questionDto : questionList) {
                        if (questionDto.getNickname().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        } else if (questionDto.getEmail().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        } else if (questionDto.getTitle().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        } else if (questionDto.getContent().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastQuestionList.size());
                for (int i = (page - 1) * 10; i < Math.min((page - 1) * 10 + 10, lastQuestionList.size()); i++) {
                    finalQuestionList.add(lastQuestionList.get(i));
                }
                questionList = finalQuestionList;
            }

            classificationDto.setQuestionList(questionList);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }
        //분류값이 있을 때
        else {

            List<QuestionDTO> questionList = adminService.getAllQuestionByTypePaging(paging);
            pagination.setArticleTotalCount(adminService.questionTotalCountClassification(paging));

            if (!keyword.isEmpty()) {

                List<QuestionDTO> lastQuestionList = new ArrayList<>();
                List<QuestionDTO> finalQuestionList = new ArrayList<>();

                questionList = adminService.getAllQuestionByType(classification);

                if (searchType.equals("아이디")) {
                    for (QuestionDTO questionDto : questionList) {
                        if (questionDto.getNickname().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        }
                    }
                } else if (searchType.equals("이메일")) {
                    for (QuestionDTO questionDto : questionList) {
                        if (questionDto.getEmail().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        }
                    }
                } else if (searchType.equals("제목")) {
                    for (QuestionDTO questionDto : questionList) {
                        if (questionDto.getTitle().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        }
                    }
                } else if (searchType.equals("내용")) {
                    for (QuestionDTO questionDto : questionList) {
                        if (questionDto.getContent().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        }
                    }
                } else {
                    for (QuestionDTO questionDto : questionList) {
                        if (questionDto.getNickname().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        } else if (questionDto.getEmail().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        } else if (questionDto.getTitle().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        } else if (questionDto.getContent().contains(keyword)) {
                            lastQuestionList.add(questionDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastQuestionList.size());
                for (int i = (page - 1) * 10; i < Math.min((page - 1) * 10 + 10, lastQuestionList.size()); i++) {
                    finalQuestionList.add(lastQuestionList.get(i));
                }
                questionList = finalQuestionList;

            }

            paging.setClassification(classification);
            classificationDto.setQuestionList(questionList);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }
    }

    @GetMapping("/ad-admin/classification")
    @ResponseBody
    public ClassificationDto adClassification(@ModelAttribute("paging") PagingDto paging,
                                              @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                                              @RequestParam(value = "classification", required = false, defaultValue = "전체") String classification,
                                              @RequestParam(value = "classification2", required = false, defaultValue = "전체") String classification2,
                                              @RequestParam(value = "classification3", required = false, defaultValue = "전체") String classification3,
                                              @RequestParam(value = "searchType", required = false, defaultValue = "전체") String searchType,
                                              @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

        log.info("배너광고 목록 레스트 컨트롤러 실행");

        paging.setPage(page);
        paging.setClassification(classification);
        if (classification2.equals("전체")) paging.setClassification2("3");
        else paging.setClassification2(classification2);
        if (classification3.equals("전체")) paging.setClassification3("3");
        else paging.setClassification3(classification3);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uClassification", classification);
        session.setAttribute("uClassification2", classification2);
        session.setAttribute("uClassification3", classification3);
        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);
        session.setAttribute("nowPage", page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        ClassificationDto classificationDto = new ClassificationDto();
        pagination.setArticleTotalCount(adminService.countAllAd(paging));

        //분류가 전체일 떄
        if (classification.equals("전체")) {

            List<AdminAdDto> adDtoList = adminService.getAllAdListByPaging(paging);

            if (!keyword.isEmpty()) {

                log.info("키워드 : 전체");

                List<AdminAdDto> lastAdminAdDtoList = new ArrayList<>();
                List<AdminAdDto> finalAdminAdDtoList = new ArrayList<>();

                adDtoList = adminService.getAllAdList(paging);

                if (searchType.equals("회사이름")) {
                    for (AdminAdDto adDto : adDtoList) {
                        if (adDto.getAdComName().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        }
                    }
                } else if (searchType.equals("가격")) {
                    for (AdminAdDto adDto : adDtoList) {
                        if (adDto.getPrice().toString().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        }
                    }
                } else if (searchType.equals("기간")) {
                    for (AdminAdDto adDto : adDtoList) {
                        if (adDto.getAdPeriod().toString().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        }
                    }
                } else {
                    for (AdminAdDto adDto : adDtoList) {
                        if (adDto.getAdComName().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        } else if (adDto.getPrice().toString().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        } else if (adDto.getAdPeriod().toString().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastAdminAdDtoList.size());
                for (int i = (page - 1) * 10; i < Math.min((page - 1) * 10 + 10, lastAdminAdDtoList.size()); i++) {
                    finalAdminAdDtoList.add(lastAdminAdDtoList.get(i));
                }
                adDtoList = finalAdminAdDtoList;
            }

            classificationDto.setAdList(adDtoList);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }
        //분류값이 있을 때
        else {

            List<AdminAdDto> adDtoList = adminService.getAllAdListByTypePaging(paging);
            pagination.setArticleTotalCount(adminService.countAdByType(paging));

            if (!keyword.isEmpty()) {

                List<AdminAdDto> lastAdminAdDtoList = new ArrayList<>();
                List<AdminAdDto> finalAdminAdDtoList = new ArrayList<>();

                adDtoList = adminService.getAllAdListByType(classification);

                if (searchType.equals("회사이름")) {
                    for (AdminAdDto adDto : adDtoList) {
                        if (adDto.getAdComName().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        }
                    }
                } else if (searchType.equals("가격")) {
                    for (AdminAdDto adDto : adDtoList) {
                        if (adDto.getPrice().toString().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        }
                    }
                } else if (searchType.equals("기간")) {
                    for (AdminAdDto adDto : adDtoList) {
                        if (adDto.getAdPeriod().toString().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        }
                    }
                } else {
                    for (AdminAdDto adDto : adDtoList) {
                        if (adDto.getAdComName().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        } else if (adDto.getPrice().toString().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        } else if (adDto.getAdPeriod().toString().contains(keyword)) {
                            lastAdminAdDtoList.add(adDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastAdminAdDtoList.size());
                for (int i = (page - 1) * 10; i < Math.min((page - 1) * 10 + 10, lastAdminAdDtoList.size()); i++) {
                    finalAdminAdDtoList.add(lastAdminAdDtoList.get(i));
                }
                adDtoList = finalAdminAdDtoList;

            }

            paging.setClassification(classification);
            classificationDto.setAdList(adDtoList);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }
    }

    @Transactional
    @PostMapping("/change-apply")
    public ResponseEntity<Integer> changeApply(@RequestParam("applyId") Integer applyId, @RequestParam("accepted") Integer accepted, @RequestParam("number") String number, @RequestParam("userId") Integer userId) throws IOException {

        log.info("승인 상태 변경 레스트 컨트롤러 실행");

//        if (accepted == 1) {
//
//            //승인에서 비승인으로 바꿀 때
//
//            log.info("승인 상태이므로 비승인 상태로 변경");
//
//            accepted = 0;
//            adminService.changeApply(applyId, accepted);
//            adminService.changeCheater(applyId, "이력 없음");
//            return ResponseEntity.status(HttpStatus.OK).body(200);
//        } else {

            //비승인에서 승인으로 바꿀 때

            log.info("비승인 상태이므로 승인 상태로 변경");

            if (!adminService.getCheatCheckList(number)) {
                log.info("중고나라 사기 조회 크롤링 실행 결과 : 사기꾼 아님");
                accepted = 1;
                adminService.changeApply(applyId, accepted);
                adminService.changeCheater(applyId, "이력 없음");
                adminService.updateUserEditorById(userId);
                int ce = adminService.countEditorDetailByUserId(userId);
                if(ce == 0) {
                    adminService.insertEditorDetailByUserId(userId);
                }
                return ResponseEntity.status(HttpStatus.OK).body(200);
            } else {
                log.info("중고나라 사기 조회 크롤링 실행 결과 : 사기꾼임");
                adminService.changeCheater(applyId, "사기 이력");
                return ResponseEntity.status(HttpStatus.OK).body(400);
            }
//        }
    }

    @GetMapping("/payment-admin/classification")
    @ResponseBody
    public ClassificationDto paymentAdminClassification(@ModelAttribute("paging") PagingDto paging, @RequestParam(value = "page",
            required = false, defaultValue = "1") int page, @RequestParam(value = "classification",
            required = false, defaultValue = "전체") String classification, @RequestParam(value = "searchType",
            required = false, defaultValue = "전체") String searchType, @RequestParam(value = "keyword",
            required = false, defaultValue = "") String keyword) {

        log.info("결제 목록 레스트 컨트롤러 실행");

        paging.setPage(page);
        paging.setClassification(classification);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uClassification", classification);
        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);
        session.setAttribute("nowPage", page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        ClassificationDto classificationDto = new ClassificationDto();
        pagination.setArticleTotalCount(adminService.countAllAdminPayment());

        //분류가 전체일 떄
        if (classification.equals("전체")) {

            List<AdminPaymentDto> adminPaymentDtoList = adminService.getAllAdminPaymentListByPaging(paging);

            if (!keyword.isEmpty()) {

                log.info("키워드 : 전체");

                List<AdminPaymentDto> lastAdminPaymentDtoList = new ArrayList<>();
                List<AdminPaymentDto> finalAdminPaymentDtoList = new ArrayList<>();

                adminPaymentDtoList = adminService.getAllAdminPaymentList();

                if (searchType.equals("내용")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getName().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("구매자")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getCustomerNickname().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("판매자")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getEditorNickname().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("imp_uid")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getImpUid().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("merchant_uid")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getMerchantUid().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("가격")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getTotalPrice().toString().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("요구사항")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getRequest().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getName().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getCustomerNickname().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getEditorNickname().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getImpUid().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getMerchantUid().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getTotalPrice().toString().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getRequest().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastAdminPaymentDtoList.size());
                for (int i = (page - 1) * 10; i < Math.min((page - 1) * 10 + 10, lastAdminPaymentDtoList.size()); i++) {
                    finalAdminPaymentDtoList.add(lastAdminPaymentDtoList.get(i));
                }
                adminPaymentDtoList = finalAdminPaymentDtoList;
            }

            classificationDto.setAdminPaymentList(adminPaymentDtoList);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }
        //분류값이 있을 때
        else {

            List<AdminPaymentDto> adminPaymentDtoList = adminService.getAllAdminPaymentListByTypePaging(paging);
            pagination.setArticleTotalCount(adminService.countAdminPaymentByType(paging));

            if (!keyword.isEmpty()) {

                log.info("키워드 : " + keyword);

                List<AdminPaymentDto> lastAdminPaymentDtoList = new ArrayList<>();
                List<AdminPaymentDto> finalAdminPaymentDtoList = new ArrayList<>();

                adminPaymentDtoList = adminService.getAllAdminPaymentListByType(classification);

                if (searchType.equals("내용")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getName().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("구매자")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getCustomerNickname().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("판매자")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getEditorNickname().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("imp_uid")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getImpUid().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("merchant_uid")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getMerchantUid().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("가격")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getTotalPrice().toString().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else if (searchType.equals("요구사항")) {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getRequest().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                } else {
                    for (AdminPaymentDto adminPaymentDto : adminPaymentDtoList) {
                        if (adminPaymentDto.getName().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getCustomerNickname().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getEditorNickname().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getImpUid().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getMerchantUid().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getTotalPrice().toString().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        } else if (adminPaymentDto.getRequest().contains(keyword)) {
                            lastAdminPaymentDtoList.add(adminPaymentDto);
                        }
                    }
                }

                pagination.setArticleTotalCount(lastAdminPaymentDtoList.size());
                for (int i = (page - 1) * 10; i < Math.min((page - 1) * 10 + 10, lastAdminPaymentDtoList.size()); i++) {
                    finalAdminPaymentDtoList.add(lastAdminPaymentDtoList.get(i));
                }
                adminPaymentDtoList = finalAdminPaymentDtoList;

            }

            paging.setClassification(classification);
            classificationDto.setAdminPaymentList(adminPaymentDtoList);
            classificationDto.setPagination(pagination);

            return classificationDto;
        }
    }

    @Transactional
    @PostMapping("/change-ad")
    public ResponseEntity<Integer> changeAd(@RequestParam("adId") Integer adId, @RequestParam("status") Integer status) {

        log.info("배너 게재 상태 변경 레스트 컨트롤러 실행");

        if (status == 1) {
            //게시에서 비게시로 바꿀 때
            log.info("게시 상태이므로 비게시 상태로 변경");
            status = 0;
            adminService.changeAd(adId, status);
            return ResponseEntity.status(HttpStatus.OK).body(200);
        } else {
            //비게시에서 게시로 바꿀 때
            log.info("비승인 상태이므로 승인 상태로 변경");
            status = 1;
            adminService.changeAd(adId, status);
            return ResponseEntity.status(HttpStatus.OK).body(200);
        }
    }

    @Transactional
    @PostMapping("/change-ad-period")
    public ResponseEntity<Integer> changeAdPeriod(@RequestParam("adId") Integer adId, @RequestParam("adPeriod") Integer adPeriod) {

        log.info("배너 기간 변경 레스트 컨트롤러 실행");

        log.info("adperi : " + adPeriod);

        adminService.changeAdPeriod(adId, adPeriod);

        return ResponseEntity.status(HttpStatus.OK).body(200);

    }

    @Transactional
    @PostMapping("/ad-admin/write")
    public ResponseEntity<Integer> insertAd(AdminAdDto adminAdDto) {

        log.info("배너 등록 레스트 컨트롤러 실행");

        adminService.insertAd(adminAdDto);
        return ResponseEntity.status(HttpStatus.OK).body(200);
    }

    @GetMapping("/notice/classification")
    @ResponseBody
    public ClassificationDto noticeClassification(@ModelAttribute("paging") PagingDto paging, @RequestParam(value = "page",
            required = false, defaultValue = "1") int page, @RequestParam(value = "searchType",
            required = false, defaultValue = "전체") String searchType, @RequestParam(value = "keyword",
            required = false, defaultValue = "") String keyword, @RequestParam(value = "classification", required = false, defaultValue = "전체") String classification) {

        log.info("관리자 공지사항 목록 레스트 컨트롤러 실행");

        paging.setRecordSize(20);

        if (classification.equals("전체")) paging.setClassification(null);
        else paging.setClassification(classification);

        paging.setPage(page);
        paging.setKeyword(keyword);
        paging.setSearchType(searchType);

        session.setAttribute("uClassification", classification);
        session.setAttribute("uSearchType", searchType);
        session.setAttribute("uKeyword", keyword);
        session.setAttribute("nowPage", page);

        Pagination pagination = new Pagination();
        pagination.setPaging(paging);
        ClassificationDto classificationDto = new ClassificationDto();
        pagination.setArticleTotalCount(adminService.countAllNotice(paging));

        List<NoticeDto> noticeList = adminService.getAllNoticeListByPaging(paging);

        if (!keyword.isEmpty()) {

            List<NoticeDto> lastNoticeList = new ArrayList<>();
            List<NoticeDto> finalNoticeList = new ArrayList<>();

            noticeList = adminService.getAllNoticeList(paging);

            if (searchType.equals("제목")) {
                for (NoticeDto noticeDto : noticeList) {
                    if (noticeDto.getTitle().contains(keyword)) {
                        lastNoticeList.add(noticeDto);
                    }
                }
            } else if (searchType.equals("내용")) {
                for (NoticeDto noticeDto : noticeList) {
                    if (noticeDto.getContent().contains(keyword)) {
                        lastNoticeList.add(noticeDto);
                    }
                }
            } else {
                for (NoticeDto noticeDto : noticeList) {
                    if (noticeDto.getTitle().contains(keyword)) {
                        lastNoticeList.add(noticeDto);
                    } else if (noticeDto.getContent().contains(keyword)) {
                        lastNoticeList.add(noticeDto);
                    }
                }
            }

            pagination.setArticleTotalCount(lastNoticeList.size());
            for (int i = (page - 1) * 20; i < Math.min((page - 1) * 20 + 20, lastNoticeList.size()); i++) {
                finalNoticeList.add(lastNoticeList.get(i));
            }
            noticeList = finalNoticeList;

        }

        for (NoticeDto noticeDto : noticeList) {
            if (noticeDto.getContent().contains("<img")) {
                noticeDto.setContent("이미지 파일 포함");
            } else {
                noticeDto.setContent(noticeDto.getContent().replaceAll("<br>", " "));
            }
        }

        classificationDto.setNoticeList(noticeList);
        classificationDto.setPagination(pagination);

        return classificationDto;
    }

    @Transactional
    @DeleteMapping("/notice-delete/{id}")
    public ResponseEntity<Integer> deleteNotice(@PathVariable(name = "id") Integer id) {
        log.info("공지사항 삭제 레스트 컨트롤러 실행");

        adminService.deleteNoticeById(id);

        return ResponseEntity.status(HttpStatus.OK).body(200);

    }

    @Transactional
    @PostMapping("/notice-write")
    public ResponseEntity<Integer> writeNotice(@RequestBody NoticeDto noticeDto) {
        log.info("공지사항 등록 레스트 컨트롤러 실행");

        adminService.insertNotice(noticeDto);

        return ResponseEntity.status(HttpStatus.OK).body(200);

    }

    @Transactional
    @PutMapping("/notice-update")
    public ResponseEntity<Integer> updateNotice(@RequestBody NoticeDto noticeDto) {
        log.info("공지사항 수정 레스트 컨트롤러 실행");

        adminService.updateNotice(noticeDto);

        return ResponseEntity.status(HttpStatus.OK).body(200);

    }
}