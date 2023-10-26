package com.green.vrink.admin.dto;

import lombok.*;

import java.sql.Timestamp;

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
    private Timestamp createdAt;
    private Integer accepted;
    private String nickname;

}
