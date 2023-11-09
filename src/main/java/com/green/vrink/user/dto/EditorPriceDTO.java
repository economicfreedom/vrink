package com.green.vrink.user.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EditorPriceDTO {
	private Integer editorId;
	private String options;
	private Integer price;
}
