package com.green.vrink.user.dto;

import lombok.Data;

@Data
public class UpdatePasswordDto {
	private String password;
	private int userId;
}
