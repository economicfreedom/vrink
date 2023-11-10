package com.green.vrink.admin.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@ToString
public class AdminPaymentDetailDto {

    private Integer paymentDetailId;
    private Integer paymentId;
    private String options;
    private int price;
    private int quantity;

}
