package com.green.vrink.admin.service;

import com.green.vrink.admin.dto.AdminAdDto;
import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.DateCountDto;
import com.green.vrink.admin.dto.PagingDto;
import com.green.vrink.community.dto.FreeBoardDTO;
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
    List<AdminSuggestDto> getAllSuggestList();
    List<AdminSuggestDto> getAllSuggestListByPaging(PagingDto paging);
    AdminSuggestDto getSuggestById(Integer id);
    Integer countAllSuggest();
    List<AdminAdDto> getAllAdList();

    List<AdminAdDto> getAllAdListByType(String classification);

    List<AdminAdDto> getAllAdListByPaging(PagingDto paging);

    List<AdminAdDto> getAllAdListByTypePaging(PagingDto paging);

    Integer countAllAd();

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

    Integer userTotalCount(PagingDto paging);

    Integer userTotalCountClassification(PagingDto paging);

    Integer countAllAdminApply();

    Integer countAdminApplyByType(PagingDto paging);

    void updateUserLevelById(User user);

    void updateUserEnabledCheckById(User user);

    void updateUserEditorById(Integer userId);

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

    List<DateCountDto> getDateCountSevenDaysByTableName(String tableName);
    List<DateCountDto> getDateCountWeekByTableName(String tableName);
    List<DateCountDto> getDateCountMonthByTableName(String tableName);
    List<DateCountDto> getEditorDateCountSevenDays();
    List<DateCountDto> getEditorDateCountMonth();
    List<DateCountDto> getEditorDateCountWeek();
}
