package com.green.vrink.user.repository.model;

import lombok.Data;

@Data
public class User {
	private Integer userId;
	private String email;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String account;
	private String accountName;
	private Integer point;
	private String userImage;
}
