package com.green.vrink.review.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class ReviewDTO {
    private Integer reviewId;
    private Integer editorId;
    private Integer userId;
    private String  content;
    private Byte    count;
    private String star;
    private String nickname;
    private String createdAt;

}
