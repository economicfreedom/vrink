package com.green.vrink.payment.controller;

import java.util.List;

import com.green.vrink.payment.repository.model.Payment;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Define;
import com.green.vrink.util.LoginCheck;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.vrink.payment.dto.PriceDTO;
import com.green.vrink.payment.service.PaymentServiceImpl;
import com.green.vrink.review.service.ReviewService;
import com.green.vrink.user.controller.EditorController;
import com.green.vrink.user.service.EditorServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
@Slf4j
public class PaymentController {
	
	private final PaymentServiceImpl paymentServiceImpl;
	private final HttpSession session;
	@GetMapping("/payment-page/{editorId}")
	public String payment(@PathVariable("editorId") Integer editorId, Model model) {
		User user = (User)session.getAttribute(Define.USER);
		List<PriceDTO> priceDTOs = paymentServiceImpl.responsePrice(editorId);
		model.addAttribute("priceDTOs", priceDTOs);
		model.addAttribute("user",user);
		return "payment/paymentPage";
	}
	@LoginCheck
	@GetMapping("/payment-list")
	public String paymentList(Model model) {
		User user = (User)session.getAttribute(Define.USER);
		List<Payment> paymentList = paymentServiceImpl.responsePayment(user.getUserId());
		model.addAttribute("paymentList",paymentList);
		return "payment/paymentList";
	}
}
