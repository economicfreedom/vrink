package com.green.vrink.reply.repository.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Reply {



    private Integer editorId;
    private Integer userId;
    private String content;
    private Byte count;
    private String createdAt;



}
