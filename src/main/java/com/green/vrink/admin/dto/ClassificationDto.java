package com.green.vrink.admin.dto;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.user.repository.model.User;
import lombok.Data;

import java.util.List;

@Data
public class ClassificationDto {
	List<AdminApplyDto> adminApplyList;
	List<FreeBoardDTO> freeboardList;
	List<User> userList;
	List<QuestionDTO> questionList;
	List<AdminAdDto> adList;
	Pagination pagination;
}
