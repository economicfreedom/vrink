package com.green.vrink.suggest.dto;

import lombok.Data;

@Data
public class PostSuggestReplyDto {
    private Integer suggestId;
    private Integer userId;
    private String content;
}
