package com.green.vrink.user.service;

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
	
	public User signIn(String email) {
		User user = userRepository.findByEmail(email);
		return user;
	}
	
	public Integer updateNickname(String userId, String nickname) {
		int result = userRepository.updateNickname(userId, nickname);
		return result;
	}

	public Integer updatePassword(String userId, String password) {
		int result = userRepository.updatePassword(userId, password);
		return result;
	}

	public Integer deleteByUserId(String userId) {
		int result = userRepository.deleteByUserId(userId);
		return result;
	}
}
