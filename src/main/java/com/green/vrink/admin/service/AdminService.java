package com.green.vrink.admin.service;

import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.PagingDto;

import java.io.IOException;
import java.util.List;

public interface AdminService {
    List<AdminApplyDto> getAllAdminApplyList();
    List<AdminApplyDto> getAllAdminApplyListByType(String classification);
    List<AdminApplyDto> getAllAdminApplyListByPaging(PagingDto paging);
    List<AdminApplyDto> getAllAdminApplyListByTypePaging(PagingDto paging);
    Integer countAllAdminApply();
    Integer countAdminApplyByType(PagingDto paging);
    void changeApply(Integer applyId, Integer accepted);
    void changeCheater(Integer applyId, String content);
    boolean getCheatCheckList(String number) throws IOException;
}
