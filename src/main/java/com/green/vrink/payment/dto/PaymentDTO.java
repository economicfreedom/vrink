package com.green.vrink.payment.dto;

import lombok.Data;

@Data
public class PaymentDTO {
    private Integer userId;
    private String name;
    private String impUid;
    private String merchantUid;
    private Integer price;
}
