package com.green.vrink.user.repository.model;

import com.green.vrink.review.repository.model.Review;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Editor {

	private Integer editorId;
	private Integer userId;
	private String profileImage;
	private String introduce;
	private String image;
	private String content;
	private String vrm; 
	
}
