package com.green.vrink.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.vrink.handle.CustomRestfulException;
import com.green.vrink.user.dto.SignUpDto;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.service.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/user")
@Slf4j
public class UserRestController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@PostMapping("/sign-up")
	public ResponseEntity<?> signUp(@RequestBody SignUpDto signUpDto) {

	
		if(signUpDto.getEmail() == null || signUpDto.getEmail().isEmpty()) { 
			throw new CustomRestfulException("아이디를 입력해주세요", HttpStatus.BAD_REQUEST); 
		}
		if(signUpDto.getPassword() == null || signUpDto.getPassword().isEmpty()) {
			throw new CustomRestfulException("비밀번호를 입력해주세요", HttpStatus.BAD_REQUEST); 
		}
		if(signUpDto.getName() == null || signUpDto.getName().isEmpty()) { 
			throw new CustomRestfulException("이름을 입력해주세요", HttpStatus.BAD_REQUEST); 
		}
		if(signUpDto.getNickname() == null || signUpDto.getNickname().isEmpty()) {
			throw new CustomRestfulException("닉네임을 입력해주세요", HttpStatus.BAD_REQUEST); 
		}
		if(signUpDto.getPhone() == null || signUpDto.getPhone().isEmpty()) { 
			throw new CustomRestfulException("휴대폰 번호를 입력해주세요", HttpStatus.BAD_REQUEST); 
		}
		
		String rawPassword = signUpDto.getPassword();
		String hashPassword = passwordEncoder.encode(rawPassword);
		signUpDto.setPassword(hashPassword);
		
		userService.signUp(signUpDto);

		return ResponseEntity.ok().build();
	}
	
	@GetMapping("/check-email/{email}")
	public int checkEmail(@PathVariable String email) {
		String result = userRepository.checkEmail(email);
		if (result == null) {
			return 0;
		}
		
		return 1;
	}
}
