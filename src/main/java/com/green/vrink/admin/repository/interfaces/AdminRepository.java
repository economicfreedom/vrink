package com.green.vrink.admin.repository.interfaces;

import com.green.vrink.admin.dto.*;
import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.suggest.dto.AdminSuggestDto;
import com.green.vrink.user.repository.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminRepository {
    List<AdminApplyDto> getAllAdminApplyList();
    List<AdminApplyDto> getAllAdminApplyListByType(String classification);
    List<AdminApplyDto> getAllAdminApplyListByPaging(PagingDto paging);
    List<AdminApplyDto> getAllAdminApplyListByTypePaging(PagingDto paging);

    List<FreeBoardDTO> getAllFreeboardList();
    List<FreeBoardDTO> getAllFreeboardListByPaging(PagingDto paging);
    FreeBoardDTO getFreeboardById(Integer id);
    Integer countAllFreeboard();

    List<AdminSuggestDto> getAllSuggestList();
    List<AdminSuggestDto> getAllSuggestListByPaging(PagingDto paging);
    AdminSuggestDto getSuggestById(Integer id);
    Integer countAllSuggest();

    List<AdminAdDto> getAllAdList(PagingDto paging);
    List<AdminAdDto> getAllAdListByType(String classification);
    List<AdminAdDto> getAllAdListByPaging(PagingDto paging);
    List<AdminAdDto> getAllAdListByTypePaging(PagingDto paging);
    Integer countAllAd(PagingDto paging);
    Integer countAdByType(PagingDto paging);
    AdminAdDto getAdById(Integer id);

    List<QuestionDTO> getAllQuestion(PagingDto paging);
    List<QuestionDTO> getAllQuestionByType(String classification);
    List<QuestionDTO> getAllQuestionPaging(PagingDto paging);
    List<QuestionDTO> getAllQuestionByTypePaging(PagingDto paging);
    QuestionDTO getQuestionById(Integer id);
    Integer questionTotalCount(PagingDto paging);
    Integer questionTotalCountClassification(PagingDto paging);

    List<User> getAllUser(PagingDto paging);
    List<User> getAllUserByType(String classification);
    List<User> getAllUserPaging(PagingDto paging);
    List<User> getAllUserByTypePaging(PagingDto paging);
    User getUserById(Integer id);

    Integer userTotalCount(PagingDto paging);
    Integer userTotalCountClassification(PagingDto paging);
    Integer countAllAdminApply();
    Integer countAdminApplyByType(PagingDto paging);

    int updateUserLevelById(User user);
    int updateUserEnabledCheckById(User user);
    int updateUserEditorById(Integer userId);
    int changeApply(@Param("applyId") Integer applyId, @Param("accepted") Integer accepted);
    int changeCheater(@Param("applyId") Integer applyId, @Param("content") String content);
    int changeAd(@Param("adId") Integer adId, @Param("status") Integer status);
    int changeAdPeriod(@Param("adId") Integer adId, @Param("adPeriod") Integer adPeriod);

    int insertEditorDetailByUserId(Integer userId);
    int countEditorDetailByUserId(Integer userId);

    int countStandardUser();
    int countEditorUser();
    int countEnabledUser();

    List<DateCountDto> getDateCustomSevenDaysByTableNameValueWhen(String tableName, String value, String when);
    List<DateCountDto> getDateCustomWeekByTableNameValueWhen(String tableName, String value, String when);
    List<DateCountDto> getDateCustomMonthByTableNameValueWhen(String tableName, String value, String when);

    int insertAd(AdminAdDto adminAdDto);

    List<AdminPaymentDto> getAllAdminPaymentList();
    List<AdminPaymentDto> getAllAdminPaymentListByType(String classification);
    List<AdminPaymentDto> getAllAdminPaymentListByPaging(PagingDto paging);
    List<AdminPaymentDto> getAllAdminPaymentListByTypePaging(PagingDto paging);

    int countAllAdminPayment();
    int countAdminPaymentByType(PagingDto paging);

    List<AdminPaymentDetailDto> getAdminPaymentDetailsById(Integer id);
    List<AdminPaymentStateDto> getAdminPaymentStatesById(Integer id);
    AdminPaymentDto getAdminPaymentDtoById(Integer id);
}
