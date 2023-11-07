package com.green.vrink.payment.controller;

import com.green.vrink.payment.dto.BuyResponseDTO;
import com.green.vrink.payment.dto.PaymentStateDTO;
import com.green.vrink.payment.service.PaymentService;
import com.green.vrink.payment.service.PaymentStateService;
import com.green.vrink.util.AsyncPageDTO;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.LoginCheck;
import com.green.vrink.util.PageDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/payment-state")
public class PaymentStateRestController {

    private final PaymentService paymentService;
    private final PaymentStateService paymentStateService;


    @PostMapping("/save-customer-confirm")
    @LoginCheck
    public ResponseEntity<?> completed(
            @RequestBody
            @Valid
            PaymentStateDTO paymentStateDTO
            , BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {


            return ResponseEntity.badRequest().body(
                    CustomResponse.builder()

                            .code(HttpStatus.BAD_REQUEST.value())
                            .message(bindingResult.getFieldError()
                                    .getDefaultMessage()

                            ) // end of builder

            ); // end of ResponseEntity

        }

        Integer res = paymentStateService.saveCustomerConfirm(paymentStateDTO);

        if (res == 0) {
            CustomResponse response = new CustomResponse(400, "가격이 일치하지 않습니다");
            return ResponseEntity.badRequest().body(
                    response

            );
        }


        return ResponseEntity.ok().build();
    }


    @GetMapping("/list-more")
    public ResponseEntity<?> listMore(
            @RequestParam(name = "page-num") Integer pageNum

            , @RequestParam(name = "user-id", defaultValue = "0") Integer userId
            , @RequestParam Integer total
            , @RequestParam(name = "keyword", required = false) String keyword
    ) {
        log.info("total {}", total);
        Criteria cri = new Criteria();
        cri.setCountPerPage(5);
        cri.setPageNum(pageNum);
        cri.setKeyword(keyword);

        List<BuyResponseDTO> buyResponseDTOS = paymentService.buyList(userId, cri);
        total = paymentService.buyListTotal(cri, userId);
        PageDTO pageDTO = new PageDTO();

        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(total);
        log.info("Test {}", pageDTO.getEndPage());

        AsyncPageDTO asyncPageDTO = new AsyncPageDTO();
        asyncPageDTO.setPageDTOs(buyResponseDTOS);
        asyncPageDTO.setHasNext(pageNum, pageDTO.getEndPage());


        return ResponseEntity.ok(asyncPageDTO);
    }

    @Data
    @AllArgsConstructor
    @Builder
    private static class CustomResponse {

        private Integer code;
        private String message;


    }
}
