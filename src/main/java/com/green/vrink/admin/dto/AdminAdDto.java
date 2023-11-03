package com.green.vrink.admin.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class AdminAdDto {

    private Integer adId;
    private String adComName;
    private String image;
    private Integer price;
    private String createdAt;
    private Integer adPeriod;
    private Integer status;

}
