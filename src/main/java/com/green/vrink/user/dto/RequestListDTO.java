package com.green.vrink.user.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RequestListDTO {

    private Integer paymentId;
    private String options;
    private int price;
    private int quantity;

}
