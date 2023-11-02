package com.green.vrink.community.dto;

import lombok.Builder;
import lombok.Data;

import javax.validation.constraints.Digits;
import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
@Builder
public class FreeBoardDTO {



    private Integer communityId;
    @Digits(integer = Integer.MAX_VALUE, fraction = 0, message = "userId는 숫자만 입력가능합니다")
    private Integer userId;
    @NotBlank(message = "title의 값은 필수 입니다.")
    private String title;
    @NotBlank(message = "content의 값은 필수 입니다.")
    private String content;
    private String createdAt;
    @NotBlank(message = "유저 닉네임의 값은 필수 입니다.")
    private String nickname;
    private Integer count;
}
