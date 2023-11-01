package com.green.vrink.review.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Data
@Builder
@AllArgsConstructor
public class ReviewDTO {
    private Integer reviewId;
    @Min(value = 0,message = "작가 번호는 필수입니다.")
    private Integer editorId;
    @Min(value = 0,message = "유저 번호는 필수입니다.")
    private Integer userId;
    @NotBlank(message = "내용은 필수입니다.")
    private String  content;
    @Min(value = 0,message = "별점은 필수입니다.")
    private Byte    count;
    private String star;
    @NotBlank(message = "닉네임은 필수입니다.")
    private String nickname;
    private String createdAt;

}
