package com.green.vrink.payment.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BuyResponseDTO {

    private Integer point;
    private Byte editorRecognize;
    private Integer paymentStateId;
    private String createdAt;
    private String nickname;
    private Integer editorId;
    private Integer userId;
    private String image;
    private Integer quantity;
    private String state;
    private Integer paymentId;


}
