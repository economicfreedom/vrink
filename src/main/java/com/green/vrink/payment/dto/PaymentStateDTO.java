package com.green.vrink.payment.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentStateDTO {


    private Integer paymentStateId;
    @Min( value = 1 ,message = "작가 아이디는 필수값 입니다")
    private Integer editorId;
    @Min( value = 1 ,message =  "결제 아이디는 필수값 입니다.")
    private Integer paymentId;
    @Min(value = 0 ,message = "작가의 승인 상태는 필수값 입니다.")
    private Byte editorRecognize;
    @Min(value = 0 ,message = "구매자의 승인 상태는 필수값 입니다.")
    private Byte customerRecognize;
    @Min( value = 1 ,message = "가격은 필수값 입니다.")
    private Integer point;
    @NotBlank(message = "결제 상태는 필수값 입니다.")
    private String state;

    private String createdAt;
    private Integer userId;

}
