package com.green.vrink.user.dto;

import lombok.Data;

@Data
public class SignInResponseDto {
    private Integer userId;
    private String email;
    private String password;
    private String name;
    private String nickname;
    private String phone;
    private String createdAt;
    private String account;
    private String accountName;
    private String editorCreatedAt;
    private Integer point;
    private String userImage;
    private String editor;
    private Integer enabledCheck;
    private Integer level;
    private Integer editorId;
}
