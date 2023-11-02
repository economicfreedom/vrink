package com.green.vrink.suggest.dto;

import lombok.Data;

@Data
public class SuggestReplyDto {
    private Integer replyId;
    private Integer suggestId;
    private Integer userId;
    private String content;
    private String createdAt;
    private String nickname;
}
