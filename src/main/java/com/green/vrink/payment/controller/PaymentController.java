package com.green.vrink.payment.controller;

import java.util.List;

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

@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
@Slf4j
public class PaymentController {
	
	private final PaymentServiceImpl paymentServiceImpl;
	
	
	
	@GetMapping("/payment-page/{editorId}")
	public String Payment(@PathVariable("editorId") Integer editorId, Model model) {
		List<PriceDTO> priceDTOs = paymentServiceImpl.responsePrice(editorId);
		model.addAttribute("priceDTOs", priceDTOs);
		return "payment/paymentPage";
	}
}
