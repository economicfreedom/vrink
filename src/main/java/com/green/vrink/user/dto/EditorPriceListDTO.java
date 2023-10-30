package com.green.vrink.user.dto;

import java.util.List;

import lombok.Data;

@Data
public class EditorPriceListDTO {
	private Integer editorId;
	private List<String> options;
	private List<Integer> prices;
}
