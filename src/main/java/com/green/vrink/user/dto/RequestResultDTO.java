package com.green.vrink.user.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestResultDTO {
    private List<RequestListDTO> requestListDTOS;
    private int quantity;
    private int price;
    public void setSumQuantity(int quantity) {
        this.quantity += quantity;
    }
    public void setSumPrice(int price){
        this.price += price;
    }

}
