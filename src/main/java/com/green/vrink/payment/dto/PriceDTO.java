package com.green.vrink.payment.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PriceDTO {
	private Integer editorId;
	private String options;
	private Integer price;
}
