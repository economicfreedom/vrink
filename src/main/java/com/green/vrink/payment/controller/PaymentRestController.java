package com.green.vrink.payment.controller;


import com.green.vrink.payment.dto.PriceDTO;
import com.green.vrink.payment.service.PaymentServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

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
    	List<PriceDTO> priceList =  paymentServiceImpl.responsePrice(editorId);
    	int sum = 0;
    	for(int i = 0; i < priceList.size(); i++) {
    		sum += priceList.get(i).getPrice()*quantity[i];
    		System.out.println(sum);
    	}
    	
    	return ResponseEntity.ok().build();
    }
}
