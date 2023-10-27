package com.green.vrink.admin.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class AdminApplyDto {

    private Integer applyId;
    private String userId;
    private String name;
    private String number;
    private String createdAt;
    private Integer accepted;
    private String nickname;
    private String cheater;

}
