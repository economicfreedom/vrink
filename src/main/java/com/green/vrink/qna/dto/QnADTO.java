package com.green.vrink.qna.dto;

import lombok.Builder;
import lombok.Data;

import javax.validation.constraints.Email;

@Data
@Builder
public class QnADTO {

    private Integer qnaId;
    private Integer userId;
    private String content;
    private String createdAt;
    private String type;
    private String title;
    @Email(message = "유효한 이메일 형식이 아닙니다.")
    private String email;
    private Integer status;



}
