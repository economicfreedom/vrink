package com.green.vrink.user.repository.interfaces;

import com.green.vrink.user.dto.ApprovalDTO;
import com.green.vrink.user.dto.EditorWriteDTO;
import com.green.vrink.user.dto.SignUpDto;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	public Integer signUp(SignUpDto signUpDto);
	public String checkEmail(String email);
    public Integer requestApproval(ApprovalDTO approvalDTO);
    public Integer editorWrite(EditorWriteDTO editorWriteDTO);

	String findUserNicknameById(Integer userId);
//    public Integer saveApply();


}
