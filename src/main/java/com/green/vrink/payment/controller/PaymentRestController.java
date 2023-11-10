package com.green.vrink.payment.controller;


import com.green.vrink.payment.dto.AutorizedCodeDTO;
import com.green.vrink.payment.dto.PaymentDTO;
import com.green.vrink.payment.dto.ValidationDTO;
import com.green.vrink.payment.repository.model.Payment;
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

    @GetMapping("/cancel/{payment-id}")
    public Payment cancel(@PathVariable("payment-id") Integer paymentId) {

        log.info(paymentId.toString());
        Payment payment = paymentServiceImpl.responseCancelData(paymentId);
        log.info("payment {} ",payment);

        return paymentServiceImpl.responseCancelData(paymentId);
    }

    @PostMapping("/payment-done")
    public ResponseEntity<?> PaymentDone(@RequestBody PaymentDTO paymentDTO) {
        paymentServiceImpl.insertPayment(paymentDTO);
        return ResponseEntity.ok().build();
    }
}
