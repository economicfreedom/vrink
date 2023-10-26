package com.green.vrink.admin.service;

import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.PagingDto;
import com.green.vrink.admin.repository.interfaces.AdminRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
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
    public Integer countAllAdminApply() {
        return adminRepository.countAllAdminApply();
    }

    @Override
    public Integer countAdminApplyByType(PagingDto paging) {
        return adminRepository.countAdminApplyByType(paging);
    }
}
