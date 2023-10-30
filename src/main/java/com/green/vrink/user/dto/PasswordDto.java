package com.green.vrink.user.dto;

import lombok.Data;

@Data
public class PasswordDto {
	private String insertPassword;
	private String encodedPassword;
}
