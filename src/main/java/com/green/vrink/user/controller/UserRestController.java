package com.green.vrink.user.controller;

import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.green.vrink.user.dto.PasswordDto;
import com.green.vrink.user.dto.SignInDto;
//import com.green.vrink.handle.CustomRestfulException;
import com.green.vrink.user.dto.SignUpDto;
import com.green.vrink.user.dto.UpdateNicknameDto;
import com.green.vrink.user.dto.UpdatePasswordDto;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.UserService;
import com.green.vrink.util.Define;

import lombok.extern.slf4j.Slf4j;

import java.util.Map;

@RestController
@RequestMapping("/user")
@Slf4j
@RequiredArgsConstructor
public class UserRestController {
	
	private final UserService userService;
	private final UserRepository userRepository;
	private final PasswordEncoder passwordEncoder;
	private final HttpSession session;
	
	@PostMapping("/sign-up")
	public ResponseEntity<?> signUp(@RequestBody SignUpDto signUpDto) {

	
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
	
	@PostMapping("/sign-in")
	public ResponseEntity<?> signIn(@RequestBody SignInDto signInDto) {
		User user = userService.signIn(signInDto.getEmail());

		 if(!passwordEncoder.matches(signInDto.getPassword(), user.getPassword())) { 
			 return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		 }

		if(user.getEnabledCheck() != 0) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}



		 session.setAttribute(Define.USER, user);
		 return ResponseEntity.ok().build();
	}
	
	// 닉네임 변경
	@PutMapping("/update/nickname/{userId}")
	public int updateNickname(@PathVariable String userId, @RequestBody Map<String,String> map, Model model) {
		String nickname = map.get("nickname");
		int result = userService.updateNickname(userId, nickname);


		if (result != 1) {
			System.out.println("닉네임 변경 실패");
			return 0;
		}

//		User user = (User) session.getAttribute("USER");
//		user.setNickname(nickname);
//		session.removeAttribute("USER");
//		session.setAttribute(Define.USER,user);
		return 1;
	}
	
	// 비밀번호 확인
	@PostMapping("/find/password")
	public int getPasswordByUserId(@RequestBody PasswordDto passwordDto) {
		if(!passwordEncoder.matches(passwordDto.getInsertPassword(), passwordDto.getEncodedPassword())) {
			return 0;
		}
		
		return 1;
	}
	
	// 비밀번호 변경
	@PutMapping("/update/password/{userId}")
	public int updatePassword(@PathVariable String userId, @RequestBody Map<String, String> map) {
		String password = map.get("password");

		int result = userService.updatePassword(userId, passwordEncoder.encode(password));
		
		if (result != 1) {
			System.out.println("비밀번호 변경 실패");
			return 0;
		}
		session.removeAttribute(Define.USER);
		return 1;
	}
	
	// TODO: 정산
//	@GetMapping("/calculate/{userId}")
//	public int calculatePoint(@PathVariable String userId ) {
//		User user = userRepository.findByUserId(userId);
//		Integer point = user.getPoint();
//		
//	}
	
	// 회원 탈퇴
	@DeleteMapping("/delete/{userId}")
	public int deleteUser(@PathVariable String userId) {
		int result = userService.deleteByUserId(userId);
		System.out.println(result);
		return 1;
	}


}
