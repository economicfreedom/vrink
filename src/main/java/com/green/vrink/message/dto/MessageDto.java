package com.green.vrink.message.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
@Builder
public class MessageDto {
    private int messageId;
    private int userId;
    private int messageTo;
    private String content;
    private String createdAt;
    private String state;
    private String url;
}
