package com.green.vrink.user.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RequestDetailDTO {

    private Integer paymentId;
    private String name;
    private String nickname;
    private String createdAt;
    private String state;
}
