package com.green.vrink.handle;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class CustomRestfulException extends RuntimeException {
	private HttpStatus httpStatus;
	
	public CustomRestfulException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}
}
