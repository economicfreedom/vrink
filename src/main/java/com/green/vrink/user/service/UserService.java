package com.green.vrink.user.service;

import com.green.vrink.user.dto.FindEmailDto;
import com.green.vrink.user.dto.FindPasswordDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import com.green.vrink.handle.CustomRestfulException;
import com.green.vrink.user.dto.SignUpDto;
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
		return userRepository.findByEmail(email);
	}

	@Transactional
	public Integer updateNickname(String userId, String nickname) {
		return userRepository.updateNickname(userId, nickname);
	}

	@Transactional
	public Integer updatePassword(Integer userId, String password) {
		return userRepository.updatePassword(userId, password);
	}

	public Integer deleteByUserId(String userId) {
		return userRepository.deleteByUserId(userId);
	}

	public Integer findUserByNickname(String nickname) {
		return userRepository.findUserByNickname(nickname);
	}

	public String findEmailByNicknameAndPhone(FindEmailDto findEmailDto) {
		return userRepository.findEmailByNicknameAndPhone(findEmailDto);
	}

	public Integer findPasswordByEmailAndName(FindPasswordDto findPasswordDto) {
		return userRepository.findPasswordByEmailAndName(findPasswordDto);
	}

	public User findByUserId(int userId) {
		return userRepository.findByUserId(userId);
	}

	public Integer findUserIdByEmail(String email) {
		return userRepository.findUserIdByEmail((email));
	}

	public Integer findUserIdBySuggestId(Integer suggestId) {
		return userRepository.findUserIdBySuggestId(suggestId);
	}

	public void deleteByEditorId(Integer editorId) {
		userRepository.deleteByEditorId(editorId);
	}

    public User getUserByUserId(Integer receiverId) {
		User user = userRepository.findByUserId(receiverId);

		return user;
	}
}
