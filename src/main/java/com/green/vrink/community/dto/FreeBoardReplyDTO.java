package com.green.vrink.community.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class FreeBoardReplyDTO {

    private Integer replyId;
    private Integer communityId;
    private Integer userId;
    private String content;
    private String createdAt;
    private String nickname;


}
