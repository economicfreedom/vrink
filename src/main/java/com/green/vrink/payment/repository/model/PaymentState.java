package com.green.vrink.payment.repository.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class PaymentState {
    private Integer paymentStateId;
    private Integer paymentId;
    private Boolean cumstomerRecognize;
    private Integer point;
    private Timestamp createdAt;
}
