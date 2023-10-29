package com.green.vrink.qna.repository.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Question {

    private Integer qId;
    private Integer qnaId;
    private Integer userId;
    private String content;
    private String createdAt;

}
