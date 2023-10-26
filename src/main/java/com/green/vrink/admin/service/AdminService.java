package com.green.vrink.admin.service;

import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.PagingDto;

import java.util.List;

public interface AdminService {
    List<AdminApplyDto> getAllAdminApplyList();
    List<AdminApplyDto> getAllAdminApplyListByType(String classification);
    List<AdminApplyDto> getAllAdminApplyListByPaging(PagingDto paging);
    List<AdminApplyDto> getAllAdminApplyListByTypePaging(PagingDto paging);
    Integer countAllAdminApply();
    Integer countAdminApplyByType(PagingDto paging);
}
