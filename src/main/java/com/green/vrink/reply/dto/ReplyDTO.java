package com.green.vrink.reply.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class ReplyDTO {

    private Integer editorId;
    private Integer userId;
    private String  content;
    private Byte    count;

}
