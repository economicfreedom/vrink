package com.green.vrink.refund.dto;

import lombok.*;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RefundDetailRequestDTO {

    @Min(value = 1,message = "결제 아이디는 필수 값입니다.")
    private Integer paymentId;
    @Min(value = 1,message = "결제상태 아이디는 필수 값입니다.")
    private Integer paymentStateId;
    @NotBlank(message = "결제 사유는 필수 값입니다")
    private String reason;
    private String reasonDetail;


}
