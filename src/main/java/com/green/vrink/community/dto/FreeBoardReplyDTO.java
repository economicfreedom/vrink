package com.green.vrink.community.dto;

import lombok.Builder;
import lombok.Data;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Data
@Builder
public class FreeBoardReplyDTO {

    private Integer replyId;
    @Min(0)
    private Integer communityId;
    @Min(0)
    private Integer userId;
    @NotBlank
    private String content;
    private String createdAt;
    @NotBlank
    private String nickname;


}
