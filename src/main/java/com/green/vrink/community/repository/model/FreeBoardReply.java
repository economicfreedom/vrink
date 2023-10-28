package com.green.vrink.community.repository.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class FreeBoardReply {

    private Integer replyId;
    private Integer communityId;
    private Integer userId;
    private String content;
    private String createdAt;
    private String nickname;


}
