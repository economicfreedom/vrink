package com.green.vrink.payment.controller;


import com.green.vrink.payment.dto.BuyResponseDTO;
import com.green.vrink.payment.service.PaymentService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.Define;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BuyListController {

    private final HttpSession httpSession;
    private final PaymentService paymentService;

    @GetMapping("/list")
    public String test(
            @RequestParam(name = "user-id", required = false) Integer userId
            , @RequestParam(name = "keyword", required = false) String keyword
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
