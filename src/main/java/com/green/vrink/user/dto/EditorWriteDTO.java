package com.green.vrink.user.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EditorWriteDTO {
	private Integer userId;
	private String profileImage;
	private String introduce;
	private String thumbnail;
	private String content;
	private String vrm;
}
