package com.green.vrink.payment.dto;

import lombok.Data;

@Data
public class ValidationDTO {
    private Integer editorId;
    private Integer quantity[];
    private Integer paidAmount;
}
