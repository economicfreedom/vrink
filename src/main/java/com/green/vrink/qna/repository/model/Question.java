package com.green.vrink.qna.repository.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Question {
    private Integer questionId;
    private Integer userId;
    private String content;
    private String createdAt;
    private String type;
    private String title;
    private String email;
    private Integer status;
}
