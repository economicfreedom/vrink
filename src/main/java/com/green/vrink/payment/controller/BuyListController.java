package com.green.vrink.payment.controller;


import com.green.vrink.payment.dto.BuyDTO;
import com.green.vrink.payment.service.PaymentService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.Define;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class BuyListController {

    private final HttpSession httpSession;
    private final PaymentService paymentService;

    @GetMapping("/list")
    public String test(
            Model model) {

        Criteria cri = new Criteria();
        User user = (User) httpSession.getAttribute(Define.USER);
        List<BuyDTO> buyDTOs = paymentService.buyList(user.getUserId(), cri);

        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(buyDTOs.size());

        model.addAttribute("list",buyDTOs);
        model.addAttribute("pageDTO",pageDTO);

        return "buyList";
    }
}
