package com.green.vrink.handle;

import org.springframework.http.HttpStatus;

public class CustomPageException extends RuntimeException {
	private HttpStatus httpStatus;
	
	public CustomPageException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}
}
