package com.green.vrink.payment.controller;

import com.green.vrink.message.service.MessageService;
import com.green.vrink.payment.dto.BuyResponseDTO;
import com.green.vrink.payment.dto.PaymentStateDTO;
import com.green.vrink.payment.service.PaymentService;
import com.green.vrink.payment.service.PaymentStateService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.EditorService;
import com.green.vrink.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/payment-state")
public class PaymentStateRestController {

    private final PaymentService paymentService;
    private final PaymentStateService paymentStateService;
    private final HttpSession httpSession;
    private final MessageService messageService;
    private final EditorService editorService;

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

        User user = (User) httpSession.getAttribute(Define.USER);
        paymentStateDTO.setUserId(user.getUserId());
        Integer res = paymentStateService.saveCustomerConfirm(paymentStateDTO);

        if (res == 0) {
            CustomResponse response = new CustomResponse(400, "가격이 일치하지 않습니다");
            return ResponseEntity.badRequest().body(
                    response

            );
        }

        Integer editorUserId =
                editorService.getUserIdByEditorId(
                        paymentStateDTO.getEditorId()
                );

        messageService.sendMessageAndSaveSpecificPage(editorUserId
                , "작가님 거래가 정상적으로 완료 되었습니다."
                , "/editor/request-view/" + paymentStateDTO.getPaymentId());


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

    @PostMapping("/editor-cancel")
    public ResponseEntity<?> eCancel(@RequestBody PaymentStateDTO paymentStateDTO) {

        int res = paymentStateService.saveEditorCancel(paymentStateDTO);


        if (res == 0) {
            return ResponseEntity.badRequest().build();

        }
        Integer paymentId = paymentStateDTO.getPaymentId();

        Integer userId = paymentStateDTO.getUserId();
        String url = "/payment/payment-list?payment-id="
                + paymentId + "&user-id="
                + userId;

        messageService.sendMessageAndSaveSpecificPage(userId
                , "요청하신 의뢰가 취소 되었습니다."
                , url);

        return ResponseEntity.ok().build();
    }

    @PostMapping("/editor-done")
    public ResponseEntity<?> eDone(@RequestBody PaymentStateDTO paymentStateDTO) {

        int res = paymentStateService.saveEditorCancel(paymentStateDTO);

        if (res == 0) {
            return ResponseEntity.badRequest().build();

        }
        Integer paymentId = paymentStateDTO.getPaymentId();
        User user = (User) httpSession.getAttribute(Define.USER);
        Integer userId = user.getUserId();
        String url = "/payment/buy-list";


        messageService.sendMessageAndSaveSpecificPage(userId
                , "작가님이 의뢰를 완료 했습니다. 확인해주세요."
                , url);

        return ResponseEntity.ok().build();
    }


    @Data
    @AllArgsConstructor
    @Builder
    private static class CustomResponse {

        private Integer code;
        private String message;


    }
}
