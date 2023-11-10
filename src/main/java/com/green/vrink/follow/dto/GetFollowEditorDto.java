package com.green.vrink.follow.dto;

import lombok.Data;

@Data
public class GetFollowEditorDto {
    private Integer editorId;
    private Integer userId;
    private String profileImage;
    private String nickname;
    private Integer count;
}
