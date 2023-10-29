package com.green.vrink.qna.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class QuestionDTO {

    private Integer qId;
    private Integer qnaId;
    private Integer userId;
    private String content;
    private String createdAt;

}
