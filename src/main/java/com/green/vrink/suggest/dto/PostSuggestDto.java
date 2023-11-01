package com.green.vrink.suggest.dto;

import lombok.Data;

@Data
public class PostSuggestDto {
    private int userId;
    private String title;
    private String content;
}
