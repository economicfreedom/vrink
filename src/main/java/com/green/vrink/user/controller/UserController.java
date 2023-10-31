package com.green.vrink.user.controller;

import javax.servlet.http.HttpSession;

import com.green.vrink.user.repository.interfaces.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.green.vrink.user.dto.SignInDto;
//import com.green.vrink.handle.CustomRestfulException;
import com.green.vrink.user.dto.SignUpDto;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.UserService;
import com.green.vrink.util.Define;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserController {

	private final UserRepository userRepository;
	private final HttpSession session;

	@GetMapping("/sign-in")
	public String signIn() {
		// 로그인
		return "user/applyForm";
	}

	@GetMapping("/sign-up")
	public String goToSignUp() {
		// 회원가입
		return "user/applyForm";
	}

	@GetMapping("/my-page")
	public String goMyPage(Model model) {
		User user = (User) session.getAttribute(Define.USER);

		if (user == null){
			return "redirect:/user/sign-in";
		}

		User newUser = userRepository.findByUserId(user.getUserId());
		model.addAttribute("newUser", newUser);
		return "user/myPage";
	}

	@GetMapping("/change-password")
	public String goChangeMyPassword(Model model) {
		User user = (User) session.getAttribute("USER");

		if (user==null){
			return "redirect:/user/sign-in";
		}

		return "user/changePassword";
	}

	@GetMapping("/log-out")
	public void logOut() {
		session.invalidate();
	}

}
