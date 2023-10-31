package com.green.vrink.admin.dto;

import com.green.vrink.community.dto.FreeBoardDTO;
import lombok.Data;

import java.util.List;

@Data
public class ClassificationDto {
	List<AdminApplyDto> adminApplyList;
	List<FreeBoardDTO> freeboardList;
	Pagination pagination;
}
