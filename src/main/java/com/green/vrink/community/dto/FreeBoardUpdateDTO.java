package com.green.vrink.community.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FreeBoardUpdateDTO {
    @NotBlank(message = "communityId 의 값은 필수 입니다.")
    @Pattern(regexp = "^[0-9]+$", message = "commuId는 숫자만 입력가능합니다.")
    private Integer communityId;
    @NotBlank(message = "userId 의 값은 필수 입니다.")
    @Pattern(regexp = "^[0-9]+$", message = "userId는 숫자만 입력가능합니다")
    private Integer userId;
    @NotBlank(message = "title의 값은 필수 입니다.")
    private String title;
    @NotBlank(message = "content의 값은 필수 입니다.")
    private String content;
    private String createdAt;
    @NotBlank(message = "유저 닉네임의 값은 필수 입니다.")
    private String nickname;
}
