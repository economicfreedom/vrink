package com.green.vrink.payment.controller;


import com.green.vrink.payment.dto.AutorizedCodeDTO;
import com.green.vrink.payment.dto.ValidationDTO;
import com.green.vrink.payment.repository.model.Payment;
import com.green.vrink.payment.repository.model.PaymentState;
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
    public ResponseEntity<?> complete(ValidationDTO validationDTO) {


        Boolean validation = paymentServiceImpl.validationPrice(validationDTO);

        if(validation) {
            return ResponseEntity.ok().build();
        }
        else {
            return ResponseEntity.badRequest().build();
        }
    }

    @PostMapping("/authorizedCode")
    public AutorizedCodeDTO AuthorizedCode() {
        return paymentServiceImpl.responseCode();
    }

    @GetMapping("/cancel/{paymentId}")
    public Payment cancel(@PathVariable("paymentId") Integer payment_id) {
        System.out.println(payment_id);
        return paymentServiceImpl.responseCancelData(payment_id);
    }

    @PostMapping("/payment-done")
    public ResponseEntity<?> PaymentDone(@RequestBody Payment payment) {
        log.info("payment : {} ",payment);
        paymentServiceImpl.insertPayment(payment);
        int paymentId = paymentServiceImpl.selectPaymentId();
        PaymentState paymentState = new PaymentState();
        paymentState.setPaymentId(paymentId);
        paymentState.setPoint(payment.getPrice());

        paymentServiceImpl.insertPaymentState(paymentState);

        return ResponseEntity.ok().build();
    }

    
}
