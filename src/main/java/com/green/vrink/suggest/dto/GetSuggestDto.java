package com.green.vrink.suggest.dto;

import lombok.Data;

@Data
public class GetSuggestDto {
    private int suggestId;
    private int userId;
    private String title;
    private String content;
    private int state;
    private String createdAt;
    private String nickname;
}
