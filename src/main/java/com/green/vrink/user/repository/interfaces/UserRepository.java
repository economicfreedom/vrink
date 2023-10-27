package com.green.vrink.user.repository.interfaces;

import com.green.vrink.user.dto.ApprovalDTO;
import com.green.vrink.user.dto.SignUpDto;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	public Integer signUp(SignUpDto signUpDto);
	public String checkEmail(String email);
    public Integer requestApproval(ApprovalDTO approvalDTO);

	String findUserNicknameById(Integer userId);
//    public Integer saveApply();


}
