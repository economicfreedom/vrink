package com.green.vrink.payment.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PaymentDetailDTO {
    private Integer paymentId;
    private String options;
    private Integer price;
    private Integer quantity;
    private Boolean state;
}
