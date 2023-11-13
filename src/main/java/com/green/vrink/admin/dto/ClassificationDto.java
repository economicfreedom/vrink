package com.green.vrink.admin.dto;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.suggest.dto.AdminSuggestDto;
import com.green.vrink.user.repository.model.User;
import lombok.*;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ClassificationDto {
	List<AdminApplyDto> adminApplyList;
	List<FreeBoardDTO> freeboardList;
	List<User> userList;
	List<QuestionDTO> questionList;
	List<AdminAdDto> adList;
	List<AdminSuggestDto> suggestList;
	List<AdminPaymentDto> adminPaymentList;
	List<NoticeDto> noticeList;
	List<AdminCalculatorDto> adminCalculatorList;
	Pagination pagination;
}
