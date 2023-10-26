package com.green.vrink.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.vrink.handle.CustomRestfulException;
import com.green.vrink.user.dto.SignUpDto;
import com.green.vrink.user.repository.interfaces.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public void signUp(SignUpDto signUpDto) {
		int result = userRepository.signUp(signUpDto);
		
		if(result != 1) {
			throw new CustomRestfulException("잘못된 입력입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	public void checkEmail(String email) {
		int result = userRepository.checkEmail(email);
		
		if (result == 1) {
			throw new CustomRestfulException("이미 존재하는 아이디입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
