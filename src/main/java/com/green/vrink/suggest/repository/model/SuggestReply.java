package com.green.vrink.suggest.repository.model;

import lombok.Data;

@Data
public class SuggestReply {
    private Integer replyId;
    private Integer suggestId;
    private Integer userId;
    private String content;
    private String createdAt;
}
