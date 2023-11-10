package com.green.vrink.follow.repository.model;

import lombok.Data;

@Data
public class Follow {
    private Integer followId;
    private Integer userId;
    private Integer editorId;
    private String createdAt;
}
