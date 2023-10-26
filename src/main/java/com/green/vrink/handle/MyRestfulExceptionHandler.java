package com.green.vrink.handle;

import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Order(1)
public class MyRestfulExceptionHandler {
	
	@ExceptionHandler(Exception.class)
	public void exception(Exception e) {
		System.out.println("==================예외발생==================");
		System.out.println(e.getMessage());
		System.out.println("==========================================");
	}
	
	@ExceptionHandler(CustomRestfulException.class)
	public String basicException(CustomRestfulException e) {
		// String <-- 메모리에 계속 올라감
		// 하나의 참조 값에 계속 할당되기 때문에 메모리 관리에 효율적임
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert(' " + e.getMessage() + " ');"); // 문자열 안에 반드시 ; 붙일 것!!
		sb.append("history.back();");
		sb.append("</script>");
		
		return sb.toString();
	}
}
