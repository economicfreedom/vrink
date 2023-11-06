package com.green.vrink.payment.dto;

import lombok.Data;

@Data
public class PaymentDTO {
    private Integer paymentId;
    private Integer userId;
    private Integer editorId;
    private String name;
    private String impUid;
    private String merchantUid;
    private Integer totalPrice;
    private String option[];
    private Integer price[];
    private Integer quantity[];
    private String request;
    private String createdAt;
}
