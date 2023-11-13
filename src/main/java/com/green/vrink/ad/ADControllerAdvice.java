package com.green.vrink.ad;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
@RequiredArgsConstructor
@Slf4j
public class ADControllerAdvice {

    private final ADService adService;

    @ModelAttribute("adImg")
    public String adImage() {

        return adService.getAdImg();

    }

}
