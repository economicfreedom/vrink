package com.green.vrink.refund.controller;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.green.vrink.refund.dto.RefundDetailRequestDTO;
import com.green.vrink.refund.service.RefundService;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

@RestController
@Slf4j
@RequestMapping("/refund")
@RequiredArgsConstructor
public class RefundRestController {
    private final RefundService refundService;


    @PostMapping("/request-refund")
    public ResponseEntity<?> requestRefund(
            @RequestBody
            @Valid
            RefundDetailRequestDTO refundDetailRequestDTO
            , BindingResult bindingResult
    ) {
        System.out.println("?");
        CustomResponse customResponse = new CustomResponse();
        if (bindingResult.hasErrors()) {
            log.info("에러 발생");
        }

        refundService.refundSave(refundDetailRequestDTO);

        log.info("여기까지옴");
        return ResponseEntity.ok().build();
    }

    @Data
    @AllArgsConstructor
    @NotBlank
    private static class CustomResponse {
        private static Integer code;
        private static String message;
    }

}
