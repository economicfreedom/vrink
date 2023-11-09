package com.green.vrink.user.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EditorPriceListDTO {
	private Integer editorId;
	private String options[];
	private Integer price[];
}
