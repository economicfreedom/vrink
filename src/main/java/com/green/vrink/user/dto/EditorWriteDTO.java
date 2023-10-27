package com.green.vrink.user.dto;

import lombok.Data;

@Data
public class EditorWriteDTO {
	private Integer userId;
	private String profileImage;
	private String introduce;
	private String image;
	private String content;
	private String vrm;
}
