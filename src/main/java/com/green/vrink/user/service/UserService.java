package com.green.vrink.user.service;

import com.green.vrink.user.dto.SignInResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import com.green.vrink.handle.CustomRestfulException;
import com.green.vrink.user.dto.SignUpDto;
import com.green.vrink.user.dto.UpdateNicknameDto;
import com.green.vrink.user.dto.UpdatePasswordDto;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.User;

@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserRepository userRepository;
	
	@Transactional
	public void signUp(SignUpDto signUpDto) {
		int result = userRepository.signUp(signUpDto);
		
		if(result != 1) {
//			throw new CustomRestfulException("잘못된 입력입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	public SignInResponseDto signIn(String email) {
		return userRepository.findByEmail(email);
	}

	@Transactional
	public Integer updateNickname(String userId, String nickname) {
		return userRepository.updateNickname(userId, nickname);
	}

	@Transactional
	public Integer updatePassword(String userId, String password) {
		return userRepository.updatePassword(userId, password);
	}

	public Integer deleteByUserId(String userId) {
		return userRepository.deleteByUserId(userId);
	}
}
