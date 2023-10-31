package com.green.vrink.user.repository.interfaces;

import com.green.vrink.user.dto.*;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserRepository {
	public Integer signUp(SignUpDto signUpDto);
	public String checkEmail(String email);
    public Integer requestApproval(ApprovalDTO approvalDTO);
    public Integer editorWrite(EditorWriteDTO editorWriteDTO);

	String findUserNicknameById(Integer userId);
//    public Integer saveApply();
	public EditorDTO findByEditorId(Integer editorId);
	public Integer updateByEditorId(EditorDTO editorDTO);

    String findVrmById(Integer editorId);

	List<EditorDTO> findEditorList(Criteria cri);

	Integer getTotal();
	
	public User findByEmail(String email);
	public User findByUserId(Integer userId);
	
	//@Param("applyId") Integer applyId, @Param("content") String content
	public Integer updateNickname(@Param("userId") String userId, @Param("nickname") String nickname);
	public Integer updatePassword(@Param("userId") String userId, @Param("password") String password);
	
	public Integer deleteByUserId(String userId);
	public Integer insertPrice(EditorPriceDTO editorPriceDTO);

	public Integer findEditorIdByUserId(Integer userId);
	public Integer calculatePoint(CalculatePointDto calculatePointDto);
	public Integer updatePoint(@Param("userId") Integer userId, @Param("point") Integer point);
}
