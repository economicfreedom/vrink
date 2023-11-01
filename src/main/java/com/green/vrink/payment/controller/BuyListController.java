package com.green.vrink.payment.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class BuyListController {

    private final HttpSession httpSession;
    @GetMapping("/list")
    public String test(
            Model model){



        return "buyList";
    }
}
