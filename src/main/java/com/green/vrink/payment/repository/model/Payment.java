package com.green.vrink.payment.repository.model;

import lombok.Data;

import java.sql.Timestamp;

@Data

public class Payment {
    private Integer paymentId;
    private Integer userId;
    private Integer editorId;
    private String name;
    private String impUid;
    private String merchantUid;
    private Integer totalPrice;
    private String createdAt;
}
