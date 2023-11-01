package com.green.vrink.payment.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BuyDTO {

    private Integer point;
    private Byte editorRecognize;
    private Byte customerRecognize;
    private Integer paymentStateId;
    private String createdAt;

}
