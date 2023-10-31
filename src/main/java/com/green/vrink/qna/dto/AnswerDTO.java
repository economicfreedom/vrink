package com.green.vrink.qna.dto;

import lombok.Builder;
import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Data
@Builder
public class AnswerDTO {

    private Integer answerId;
    @Min(0)
    private Integer questionId;
    @Min(0)
    private Integer userId;
    @NotBlank(message = "내용은 필수 입니다.")
    private String content;
    private String createdAt;

}
