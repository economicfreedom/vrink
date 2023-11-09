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
    private String mainImage;
    private String hImage;
    private String vImage;
    private Integer price;
    private String createdAt;
    private Integer adPeriod;
    private Integer status;
    private Integer category;
    private Integer isNotice;

}
