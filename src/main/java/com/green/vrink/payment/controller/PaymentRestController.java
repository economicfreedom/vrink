package com.green.vrink.payment.controller;


import com.green.vrink.payment.dto.AutorizedCodeDTO;
import com.green.vrink.payment.dto.PriceDTO;
import com.green.vrink.payment.dto.ValidationDTO;
import com.green.vrink.payment.repository.model.Payment;
import com.green.vrink.payment.service.PaymentServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.springframework.http.HttpStatus;
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
            cancel();
            return ResponseEntity.badRequest().build();
        }
    }

    @PostMapping("/authorizedCode")
    public AutorizedCodeDTO AuthorizedCode() {
        return paymentServiceImpl.responseCode();
    }

    @PostMapping("/cancel")
    public ResponseEntity<?> cancel() {

        return ResponseEntity.ok().build();
    }

    @PostMapping("/payment-done")
    public ResponseEntity<?> PaymentDone(@RequestBody Payment payment) {
        log.info("여기기기기 {}", payment);
        paymentServiceImpl.insertPayment(payment);
        return ResponseEntity.ok().build();
    }
}
