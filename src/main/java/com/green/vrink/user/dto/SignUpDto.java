package com.green.vrink.user.dto;

import lombok.Data;

@Data
public class SignUpDto {
	private String email;
	private String password;
	private String name;
	private String nickname;
	private String phone;
}
