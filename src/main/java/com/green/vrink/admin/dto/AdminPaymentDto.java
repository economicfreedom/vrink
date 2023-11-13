package com.green.vrink.admin.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@ToString
public class AdminPaymentDto {
    private Integer paymentId;
    private Integer userId;
    private Integer editorId;
    private String name;
    private String impUid;
    private String merchantUid;
    private Integer totalPrice;
    private String request;
    private String createdAt;
    private String customerNickname;
    private String editorNickname;
    private String state;
    private Integer paymentStateId;
}
