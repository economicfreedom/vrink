package com.green.vrink.notice.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class NoticeDto {

    private Integer noticeId;
    private String title;
    private String content;
    private String type;
    private String createdAt;

}
