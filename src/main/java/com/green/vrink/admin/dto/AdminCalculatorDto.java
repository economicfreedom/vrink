package com.green.vrink.admin.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class AdminCalculatorDto {

    private Integer calId;
    private String editorId;
    private String nickname;
    private Long calPrice;
    private Long realCalPrice;
    private Long charge;
    private Long totalPrice;
    private Long totalRealPrice;
    private Long totalCharge;
    private int calStatus;
    private String createdAt;
    private String completeDate;

}