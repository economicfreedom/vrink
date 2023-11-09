package com.green.vrink.user.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
public class EditorDTO {
	private Integer editorId;
	private Integer userId;
	private String profileImage;
	private String introduce;
	private String thumbnail;
	private String content;
	private String vrm; 
	private String nickname;
	private Double count;
	private String delImage[];
	private String tags[];
	private String star;
}
