package com.green.vrink.admin.dto;

import lombok.Data;

import java.util.List;

@Data
public class AdminApplyClassificationDto {
	List<AdminApplyDto> adminApplyList;
	Pagination pagination;
}
