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

    private String point;
    private Byte editorRecognize;
    private Byte customerRecognize;
    private Integer paymentStateId;
    private String createdAt;
    private String nickname;
    private Integer editorId;
    private Integer userId;
    private String image;
    private Integer quantity;
    private String state;
    private Integer paymentId;
    private String email;
    private String phone;
    private String name;


}
