package com.green.vrink.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

//import com.green.vrink.handle.CustomRestfulException;
import com.green.vrink.user.dto.SignUpDto;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.service.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/user")
@Slf4j
public class UserRestController {
	
	@Autowired
	UserService userService;
	@Autowired
	UserRepository userRepository;
	
	@PostMapping("/sign-up")
	public String signUp(@RequestBody SignUpDto signUpDto) {

	
		if(signUpDto.getEmail() == null || signUpDto.getEmail().isEmpty()) { 
//			throw new CustomRestfulException("아이디를 입력해주세요", HttpStatus.BAD_REQUEST);
		}
		if(signUpDto.getPassword() == null || signUpDto.getPassword().isEmpty()) {
//			throw new CustomRestfulException("비밀번호를 입력해주세요", HttpStatus.BAD_REQUEST);
		}
		if(signUpDto.getName() == null || signUpDto.getName().isEmpty()) { 
//			throw new CustomRestfulException("이름을 입력해주세요", HttpStatus.BAD_REQUEST);
		}
		if(signUpDto.getNickname() == null || signUpDto.getNickname().isEmpty()) {
//			throw new CustomRestfulException("닉네임을 입력해주세요", HttpStatus.BAD_REQUEST);
		}
		if(signUpDto.getPhone() == null || signUpDto.getPhone().isEmpty()) { 
//			throw new CustomRestfulException("휴대폰 번호를 입력해주세요", HttpStatus.BAD_REQUEST);
		}
		 
		log.info("test {} ", signUpDto);
		userService.signUp(signUpDto);

		return "http://localhost/editor/apply-form";
	}
	
	@GetMapping("/check-email")
	public int checkEmail(String email) {
		int result = userRepository.checkEmail(email);
		
		return result;
	}
}
