package com.green.vrink.review.repository.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Review {



    private Integer editorId;
    private Integer userId;
    private String content;
    private Byte count;
    private String createdAt;



}
