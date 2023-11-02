package com.green.vrink.qna.dto;

import lombok.Builder;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Data
@Builder
public class QuestionDTO {

    private Integer questionId;
    @Min(value = 0, message = "유저 번호는 필수 값 입니다.")
    private Integer userId;
    @NotBlank(message = "문의 내용은 필수 입니다.")
    private String content;
    private String createdAt;
    @NotBlank
    private String type;
    @NotBlank(message = "제목은 필수 입니다.")
    private String title;
//    @Email(message = "유효한 이메일 형식이 아닙니다.")
    private String email;
    @NotBlank(message = "유저 닉네임은 필수 값 입니다.")
    private String nickname;

    private Integer status;


}
