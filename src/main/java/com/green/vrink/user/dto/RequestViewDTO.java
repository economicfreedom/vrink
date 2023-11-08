package com.green.vrink.user.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RequestViewDTO {
  private  Integer paymentId;
  private Integer editorId;
  private  String name;
  private  String nickname;
  private  String phone;
  private  String email;
  private  String createdAt;
  private  String request;

}
