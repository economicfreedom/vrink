package com.green.vrink.review.dto;

import lombok.Data;

@Data
public class ReviewCountDTO {
    private Integer editorId;
    private double count;
    private String nickname;
    private String thumbnail;
    private String introduce;
}
