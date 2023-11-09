package com.green.vrink.suggest.dto;

import lombok.Data;

@Data
public class AcceptSuggestDto {
    private Integer receiverId;
    private String content;
    private String url;
}
