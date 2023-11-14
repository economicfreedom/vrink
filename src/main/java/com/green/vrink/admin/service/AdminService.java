package com.green.vrink.admin.service;

import com.green.vrink.admin.dto.*;
import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.suggest.dto.AdminSuggestDto;
import com.green.vrink.user.repository.model.User;

import java.io.IOException;
import java.util.List;

public interface AdminService {
    List<AdminApplyDto> getAllAdminApplyList();

    List<AdminApplyDto> getAllAdminApplyListByType(String classification);

    List<AdminApplyDto> getAllAdminApplyListByPaging(PagingDto paging);

    List<AdminApplyDto> getAllAdminApplyListByTypePaging(PagingDto paging);

    List<FreeBoardDTO> getAllFreeboardList();

    List<FreeBoardDTO> getAllFreeboardListByPaging(PagingDto paging);

    List<User> getAllUser(PagingDto paging);

    List<User> getAllUserByType(String classification);

    List<User> getAllUserPaging(PagingDto paging);

    List<User> getAllUserByTypePaging(PagingDto paging);

    FreeBoardDTO getFreeboardById(Integer id);

    Integer countAllFreeboard();
    List<AdminSuggestDto> getAllSuggestList(PagingDto paging);
    List<AdminSuggestDto> getAllSuggestListByPaging(PagingDto paging);
    AdminSuggestDto getSuggestById(Integer id);
    Integer countAllSuggest(PagingDto paging);
    List<AdminAdDto> getAllAdList(PagingDto paging);

    List<AdminAdDto> getAllAdListByType(String classification);

    List<AdminAdDto> getAllAdListByPaging(PagingDto paging);

    List<AdminAdDto> getAllAdListByTypePaging(PagingDto paging);

    Integer countAllAd(PagingDto paging);

    Integer countAdByType(PagingDto paging);

    List<QuestionDTO> getAllQuestion(PagingDto paging);

    List<QuestionDTO> getAllQuestionByType(String classification);

    List<QuestionDTO> getAllQuestionPaging(PagingDto paging);

    List<QuestionDTO> getAllQuestionByTypePaging(PagingDto paging);

    QuestionDTO getQuestionById(Integer id);

    Integer questionTotalCount(PagingDto paging);

    Integer questionTotalCountClassification(PagingDto paging);

    AdminAdDto getAdById(Integer id);

    User getUserById(Integer id);
    User getUserByNickname(String nickname);

    Integer userTotalCount(PagingDto paging);

    Integer userTotalCountClassification(PagingDto paging);

    Integer countAllAdminApply();

    Integer countAdminApplyByType(PagingDto paging);

    void updateUserLevelById(User user);

    void updateUserEnabledCheckById(User user);

    void updateUserEditorById(Integer userId, String number, String accountName);

    void changeApply(Integer applyId, Integer accepted);

    void changeCheater(Integer applyId, String content);

    void changeAd(Integer adId, Integer status);

    void changeAdPeriod(Integer adId, Integer adPeriod);

    boolean getCheatCheckList(String number) throws IOException;

    void insertEditorDetailByUserId(Integer userId);

    int countEditorDetailByUserId(Integer userId);

    int countStandardUser();
    int countEditorUser();
    int countEnabledUser();

    List<DateCountDto> getDateCustomSevenDaysByTableNameValueWhen(String tableName, String value, String when);
    List<DateCountDto> getDateCustomWeekByTableNameValueWhen(String tableName, String value, String when);
    List<DateCountDto> getDateCustomMonthByTableNameValueWhen(String tableName, String value, String when);

    List<AdminPaymentDto> getAllAdminPaymentList();
    List<AdminPaymentDto> getAllAdminPaymentListByType(String classification);
    List<AdminPaymentDto> getAllAdminPaymentListByPaging(PagingDto paging);
    List<AdminPaymentDto> getAllAdminPaymentListByTypePaging(PagingDto paging);

    int countAllAdminPayment();
    int countAdminPaymentByType(PagingDto paging);

    void insertAd(AdminAdDto adminAdDto);

    List<AdminPaymentDetailDto> getAdminPaymentDetailsById(Integer id);
    List<AdminPaymentStateDto> getAdminPaymentStatesById(Integer id);
    AdminPaymentDto getAdminPaymentDtoById(Integer id);

    List<AdminCalculatorDto> getAllAdminCalculatorList();
    List<AdminCalculatorDto> getAllAdminCalculatorListByType(String classification);
    List<AdminCalculatorDto> getAllAdminCalculatorListByPaging(PagingDto paging);
    List<AdminCalculatorDto> getAllAdminCalculatorListByTypePaging(PagingDto paging);
    int countAllAdminCalculator();
    int countAdminCalculatorByType(PagingDto paging);
    List<AdminCalculatorDto> getAdminCalculatorDetailOkListByEditorId(Integer id);
    List<AdminCalculatorDto> getAdminCalculatorDetailNoListByEditorId(Integer id);

    List<NoticeDto> getAllNoticeList(PagingDto paging);
    List<NoticeDto> getAllNoticeListByPaging(PagingDto paging);
    NoticeDto getNoticeById(Integer id);
    Integer countAllNotice(PagingDto paging);
    void deleteNoticeById(Integer id);

    void insertNotice(NoticeDto noticeDto);
    void updateNotice(NoticeDto noticeDto);

    void updateCalStatusByEditorId(Integer editorId);

}
