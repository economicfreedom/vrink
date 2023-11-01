package com.green.vrink.admin.repository.interfaces;

import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.PagingDto;
import com.green.vrink.community.dto.FreeBoardDTO;
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
    List<User> getAllUser(PagingDto paging);
    List<User> getAllUserByType(String classification);
    List<User> getAllUserPaging(PagingDto paging);
    List<User> getAllUserByTypePaging(PagingDto paging);
    User getUserById(Integer id);
    Integer userTotalCount(PagingDto paging);
    Integer userTotalCountClassification(PagingDto paging);
    FreeBoardDTO getFreeboardById(Integer id);
    Integer countAllFreeboard();
    Integer countAllAdminApply();
    Integer countAdminApplyByType(PagingDto paging);
    int changeApply(@Param("applyId") Integer applyId, @Param("accepted") Integer accepted);
    int changeCheater(@Param("applyId") Integer applyId, @Param("content") String content);

}
