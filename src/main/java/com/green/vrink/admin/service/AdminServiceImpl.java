package com.green.vrink.admin.service;

import com.green.vrink.admin.dto.*;
import com.green.vrink.admin.repository.interfaces.AdminRepository;
import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.suggest.dto.AdminSuggestDto;
import com.green.vrink.user.repository.model.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class AdminServiceImpl implements AdminService {

    private final AdminRepository adminRepository;

    @Override
    public List<AdminApplyDto> getAllAdminApplyList() {
        return adminRepository.getAllAdminApplyList();
    }

    @Override
    public List<AdminApplyDto> getAllAdminApplyListByType(String classification) {
        return adminRepository.getAllAdminApplyListByType(classification);
    }

    @Override
    public List<AdminApplyDto> getAllAdminApplyListByPaging(PagingDto paging) {
        return adminRepository.getAllAdminApplyListByPaging(paging);
    }

    @Override
    public List<AdminApplyDto> getAllAdminApplyListByTypePaging(PagingDto paging) {
        return adminRepository.getAllAdminApplyListByTypePaging(paging);
    }

    @Override
    public List<FreeBoardDTO> getAllFreeboardList() {
        return adminRepository.getAllFreeboardList();
    }

    @Override
    public List<FreeBoardDTO> getAllFreeboardListByPaging(PagingDto paging) {
        return adminRepository.getAllFreeboardListByPaging(paging);
    }

    @Override
    public List<User> getAllUser(PagingDto paging) {
        return adminRepository.getAllUser(paging);
    }

    @Override
    public List<User> getAllUserByType(String classification) {
        return adminRepository.getAllUserByType(classification);
    }

    @Override
    public List<User> getAllUserPaging(PagingDto paging) {
        return adminRepository.getAllUserPaging(paging);
    }

    @Override
    public List<User> getAllUserByTypePaging(PagingDto paging) {
        return adminRepository.getAllUserByTypePaging(paging);
    }

    @Override
    public User getUserById(Integer id) {
        return adminRepository.getUserById(id);
    }

    @Override
    public User getUserByNickname(String nickname) {
        return adminRepository.getUserByNickname(nickname);
    }

    @Override
    public Integer userTotalCount(PagingDto paging) {
        return adminRepository.userTotalCount(paging);
    }

    @Override
    public Integer userTotalCountClassification(PagingDto paging) {
        return adminRepository.userTotalCountClassification(paging);
    }

    @Override
    public FreeBoardDTO getFreeboardById(Integer id) {
        return adminRepository.getFreeboardById(id);
    }

    @Override
    public Integer countAllFreeboard() {
        return adminRepository.countAllFreeboard();
    }

    @Override
    public List<AdminSuggestDto> getAllSuggestList(PagingDto paging) {
        return adminRepository.getAllSuggestList(paging);
    }

    @Override
    public List<AdminSuggestDto> getAllSuggestListByPaging(PagingDto paging) {
        return adminRepository.getAllSuggestListByPaging(paging);
    }

    @Override
    public AdminSuggestDto getSuggestById(Integer id) {
        return adminRepository.getSuggestById(id);
    }

    @Override
    public Integer countAllSuggest(PagingDto paging) {
        return adminRepository.countAllSuggest(paging);
    }

    @Override
    public List<AdminAdDto> getAllAdList(PagingDto paging) {
        return adminRepository.getAllAdList(paging);
    }

    @Override
    public List<AdminAdDto> getAllAdListByType(String classification) {
        return adminRepository.getAllAdListByType(classification);
    }

    @Override
    public List<AdminAdDto> getAllAdListByPaging(PagingDto paging) {
        return adminRepository.getAllAdListByPaging(paging);
    }

    @Override
    public List<AdminAdDto> getAllAdListByTypePaging(PagingDto paging) {
        return adminRepository.getAllAdListByTypePaging(paging);
    }

    @Override
    public Integer countAllAd(PagingDto paging) {
        return adminRepository.countAllAd(paging);
    }

    @Override
    public Integer countAdByType(PagingDto paging) {
        return adminRepository.countAdByType(paging);
    }

    @Override
    public List<QuestionDTO> getAllQuestion(PagingDto paging) {
        return adminRepository.getAllQuestion(paging);
    }

    @Override
    public List<QuestionDTO> getAllQuestionByType(String classification) {
        return adminRepository.getAllQuestionByType(classification);
    }

    @Override
    public List<QuestionDTO> getAllQuestionPaging(PagingDto paging) {
        return adminRepository.getAllQuestionPaging(paging);
    }

    @Override
    public List<QuestionDTO> getAllQuestionByTypePaging(PagingDto paging) {
        return adminRepository.getAllQuestionByTypePaging(paging);
    }

    @Override
    public QuestionDTO getQuestionById(Integer id) {
        return adminRepository.getQuestionById(id);
    }

    @Override
    public Integer questionTotalCount(PagingDto paging) {
        return adminRepository.questionTotalCount(paging);
    }

    @Override
    public Integer questionTotalCountClassification(PagingDto paging) {
        return adminRepository.questionTotalCountClassification(paging);
    }

    @Override
    public AdminAdDto getAdById(Integer id) {
        return adminRepository.getAdById(id);
    }

    @Override
    public Integer countAllAdminApply() {
        return adminRepository.countAllAdminApply();
    }

    @Override
    public Integer countAdminApplyByType(PagingDto paging) {
        return adminRepository.countAdminApplyByType(paging);
    }

    @Override
    public void updateUserLevelById(User user) {
        int result = adminRepository.updateUserLevelById(user);
    }

    @Override
    public void updateUserEnabledCheckById(User user) {
        int result = adminRepository.updateUserEnabledCheckById(user);
    }

    @Override
    public void updateUserEditorById(Integer userId) {
        int result = adminRepository.updateUserEditorById(userId);
    }

    @Transactional
    public void changeApply(Integer applyId, Integer accepted) {
        int result = adminRepository.changeApply(applyId, accepted);
//        if(result != 1) {
//            throw new CustomRestfulException("승인 상태 변경에 실패했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
//        }
    }

    @Transactional
    public void changeCheater(Integer applyId, String content) {
        int result = adminRepository.changeCheater(applyId, content);
//        if(result != 1) {
//            throw new CustomRestfulException("승인 상태 변경에 실패했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
//        }
    }

    @Override
    public void changeAd(Integer adId, Integer status) {
        adminRepository.changeAd(adId, status);
    }

    @Override
    public void changeAdPeriod(Integer adId, Integer adPeriod) {
        adminRepository.changeAdPeriod(adId, adPeriod);
    }

    public boolean getCheatCheckList(String number) throws IOException {

        log.info("중고나라 사기 계좌 조회 크롤링 서비스 실행");

        String cheatCheckURL = "https://web.joongna.com/fraud/result?inputValue=" +
                number +
                "&type=account_number";

        List<CheatCheckDto> cheatCheckList = new ArrayList<>();
        Document document = Jsoup.connect(cheatCheckURL).get();

        Elements contents = document.getElementsByClass("text-[14px] text-jngreen");

        for (Element content : contents) {
            CheatCheckDto cheatCheckDto = CheatCheckDto.builder()
                    .subject(content.text())		// 제목
                    .build();
            cheatCheckList.add(cheatCheckDto);
        }

        if(cheatCheckList.size() == 3) return false;
        else return true;
    }

    @Override
    public void insertEditorDetailByUserId(Integer userId) {
        int result = adminRepository.insertEditorDetailByUserId(userId);
    }

    @Override
    public int countEditorDetailByUserId(Integer userId) {
        return adminRepository.countEditorDetailByUserId(userId);
    }

    @Override
    public int countStandardUser() {
        return adminRepository.countStandardUser();
    }

    @Override
    public int countEditorUser() {
        return adminRepository.countEditorUser();
    }

    @Override
    public int countEnabledUser() {
        return adminRepository.countEnabledUser();
    }

    @Override
    public List<DateCountDto> getDateCustomSevenDaysByTableNameValueWhen(String tableName, String value, String when) {
        return adminRepository.getDateCustomSevenDaysByTableNameValueWhen(tableName, value, when);
    }

    @Override
    public List<DateCountDto> getDateCustomWeekByTableNameValueWhen(String tableName, String value, String when) {
        return adminRepository.getDateCustomWeekByTableNameValueWhen(tableName, value, when);
    }

    @Override
    public List<DateCountDto> getDateCustomMonthByTableNameValueWhen(String tableName, String value, String when) {
        return adminRepository.getDateCustomMonthByTableNameValueWhen(tableName, value, when);
    }

    @Override
    public List<AdminPaymentDto> getAllAdminPaymentList() {
        return adminRepository.getAllAdminPaymentList();
    }

    @Override
    public List<AdminPaymentDto> getAllAdminPaymentListByType(String classification) {
        return adminRepository.getAllAdminPaymentListByType(classification);
    }

    @Override
    public List<AdminPaymentDto> getAllAdminPaymentListByPaging(PagingDto paging) {
        return adminRepository.getAllAdminPaymentListByPaging(paging);
    }

    @Override
    public List<AdminPaymentDto> getAllAdminPaymentListByTypePaging(PagingDto paging) {
        return adminRepository.getAllAdminPaymentListByTypePaging(paging);
    }

    @Override
    public int countAllAdminPayment() {
        return adminRepository.countAllAdminPayment();
    }

    @Override
    public int countAdminPaymentByType(PagingDto paging) {
        return adminRepository.countAdminPaymentByType(paging);
    }

    @Override
    public void insertAd(AdminAdDto adminAdDto) {
        adminRepository.insertAd(adminAdDto);
    }

    @Override
    public List<AdminPaymentDetailDto> getAdminPaymentDetailsById(Integer id) {
        return adminRepository.getAdminPaymentDetailsById(id);
    }

    @Override
    public List<AdminPaymentStateDto> getAdminPaymentStatesById(Integer id) {
        return adminRepository.getAdminPaymentStatesById(id);
    }

    @Override
    public AdminPaymentDto getAdminPaymentDtoById(Integer id) {
        return adminRepository.getAdminPaymentDtoById(id);
    }

    @Override
    public List<NoticeDto> getAllNoticeList(PagingDto paging) {
        return adminRepository.getAllNoticeList(paging);
    }

    @Override
    public List<NoticeDto> getAllNoticeListByPaging(PagingDto paging) {
        return adminRepository.getAllNoticeListByPaging(paging);
    }

    @Override
    public NoticeDto getNoticeById(Integer id) {
        return adminRepository.getNoticeById(id);
    }

    @Override
    public Integer countAllNotice(PagingDto paging) {
        return adminRepository.countAllNotice(paging);
    }

    @Override
    public void deleteNoticeById(Integer id) {
        adminRepository.deleteNoticeById(id);
    }

    @Override
    public void insertNotice(NoticeDto noticeDto) {
        adminRepository.insertNotice(noticeDto);
    }

    @Override
    public void updateNotice(NoticeDto noticeDto) {
        adminRepository.updateNotice(noticeDto);
    }

}
