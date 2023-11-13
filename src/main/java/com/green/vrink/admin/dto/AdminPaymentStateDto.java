package com.green.vrink.admin.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@ToString
public class AdminPaymentStateDto {

    private String state;
    private String createdAt;

}
