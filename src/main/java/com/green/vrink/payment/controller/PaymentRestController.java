package com.green.vrink.payment.controller;


import com.green.vrink.payment.service.PaymentServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/payment")
@Slf4j
@RequiredArgsConstructor
public class PaymentRestController {
    private final PaymentServiceImpl paymentServiceImpl;

    @PostMapping("/validation")
    public ResponseEntity<?> complete(Integer editorId,Integer quantity[]) {
    	System.out.println(editorId);
    	for(int i = 0; i<quantity.length; i++) {
    		System.out.println(quantity[i]);
    	}
    	
    	return ResponseEntity.ok().build();
    }
}
