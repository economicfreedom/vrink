package com.green.vrink.payment.controller;

import java.util.List;

import com.green.vrink.payment.dto.PaymentDetailDTO;
import com.green.vrink.payment.repository.model.Payment;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Define;
import com.green.vrink.util.LoginCheck;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.green.vrink.payment.dto.PriceDTO;
import com.green.vrink.payment.service.PaymentServiceImpl;

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
	@LoginCheck
	@GetMapping("/payment-page")
	public String payment(@RequestParam("editor-id") Integer editorId, Model model) {
		User user = (User)session.getAttribute(Define.USER);
		List<PriceDTO> priceDTOs = paymentServiceImpl.responsePrice(editorId);
		model.addAttribute("priceDTOs", priceDTOs);
		model.addAttribute("user",user);
		return "payment/paymentPage";
	}
	@LoginCheck
	@GetMapping("/payment-list")
	public String paymentList(@RequestParam("payment-id") Integer paymentId,@RequestParam("user-id") Integer userId, Model model) {
		User user = (User)session.getAttribute(Define.USER);
		if((int)userId != (int)user.getUserId()) {
			return "redirect:/";
		}
		Payment payment = paymentServiceImpl.responsePayment(paymentId);
		List<PaymentDetailDTO> paymentDetail = paymentServiceImpl.responsePaymentDetail(paymentId);
		model.addAttribute("payment",payment);
		model.addAttribute("paymentDetail",paymentDetail);
		return "payment/paymentList";
	}
}
