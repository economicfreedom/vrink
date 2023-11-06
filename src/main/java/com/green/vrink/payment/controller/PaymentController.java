package com.green.vrink.payment.controller;

import java.util.List;

import com.green.vrink.payment.dto.BuyResponseDTO;
import com.green.vrink.payment.dto.PaymentDTO;
import com.green.vrink.payment.dto.PaymentDetailDTO;
import com.green.vrink.payment.repository.model.Payment;
import com.green.vrink.payment.service.PaymentService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.Define;
import com.green.vrink.util.LoginCheck;
import com.green.vrink.util.PageDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.green.vrink.payment.dto.PriceDTO;
import com.green.vrink.payment.service.PaymentServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
@Slf4j
public class PaymentController {


    private final PaymentServiceImpl paymentServiceImpl;
    private final HttpSession session;
    private final HttpSession httpSession;
    private final PaymentService paymentService;

    @LoginCheck
    @GetMapping("/payment-page")
    public String payment(@RequestParam("editor-id") Integer editorId, Model model) {
        User user = (User) session.getAttribute(Define.USER);
        List<PriceDTO> priceDTOs = paymentServiceImpl.responsePrice(editorId);
        model.addAttribute("priceDTOs", priceDTOs);
        model.addAttribute("user", user);
        return "payment/paymentPage";
    }

    @LoginCheck
    @GetMapping("/payment-list")
    public String paymentList(@RequestParam("payment-id") Integer paymentId, @RequestParam("user-id") Integer userId, Model model) {
        User user = (User) session.getAttribute(Define.USER);
        if ((int) userId != (int) user.getUserId()) {
            return "redirect:/";
        }
        PaymentDTO paymentDTO = paymentServiceImpl.responsePayment(paymentId);
        List<PaymentDetailDTO> paymentDetail = paymentServiceImpl.responsePaymentDetail(paymentId);
        model.addAttribute("payment", paymentDTO);
        model.addAttribute("paymentDetail", paymentDetail);
        return "payment/paymentList";
    }


    @GetMapping("/buy-list")
    public String test(
            @RequestParam(name = "keyword", required = false) String keyword
            , Model model

    ) {

        Criteria cri = new Criteria();
        cri.setCountPerPage(5);
        cri.setPageNum(1);
        cri.setKeyword(keyword);
        User user = (User) httpSession.getAttribute(Define.USER);

        List<BuyResponseDTO> buyResponseDTOS = paymentService.buyList(user.getUserId(), cri);

        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(buyResponseDTOS.size());

        boolean nextPage = pageDTO.getEndPage() == 1;


        log.info("구매 목록 : ", buyResponseDTOS);

        boolean hasNext = pageDTO.getEndPage() > 1;

        log.info("다음 페이지가 있는가? : {}", hasNext);
        model.addAttribute("list", buyResponseDTOS);
        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("hasNext", hasNext);

        return "buyList";
    }


}
