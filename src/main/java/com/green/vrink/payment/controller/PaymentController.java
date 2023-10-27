package com.green.vrink.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@GetMapping("/payment-page")
	public String Payment() {
		return "payment/paymentPage";
	}
}
