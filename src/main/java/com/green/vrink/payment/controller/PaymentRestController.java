package com.green.vrink.payment.controller;


import com.green.vrink.message.service.MessageService;
import com.green.vrink.payment.dto.AutorizedCodeDTO;
import com.green.vrink.payment.dto.PaymentDTO;
import com.green.vrink.payment.dto.ValidationDTO;
import com.green.vrink.payment.repository.model.Payment;
import com.green.vrink.payment.service.PaymentServiceImpl;
import com.green.vrink.user.service.EditorService;
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
    private final MessageService messageService;
    private final EditorService editorService;
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
        Integer userId = paymentDTO.getUserId();
        String name = paymentDTO.getName();
        String content = name + "에 대한 결제가 완료 되었습니다.";
        String userUrl = "/payment/buy-list";
        messageService.sendMessageAndSaveSpecificPage(userId,content,userUrl);
        String editorUrl = "/editor/request-list";
        String editorContent =name+"에 대한 의뢰 요청이 들어왔습니다. 확인해주세요";


        Integer editorUserId = editorService
                .getUserIdByEditorId(paymentDTO.getEditorId());
        messageService.sendMessageAndSaveSpecificPage(editorUserId,editorContent,editorUrl);


        return ResponseEntity.ok().build();
    }
}
