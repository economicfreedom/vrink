package com.green.vrink.suggest.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AdminSuggestDto {
    private int suggestId;
    private int userId;
    private String title;
    private String content;
    private String createdAt;
    private String nickname;
    private int count;
}
