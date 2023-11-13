package com.green.vrink.util;

import lombok.Getter;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;

@Component
@Getter
public class Test {
    String test;


    @Bean
    public void setTest(){
        test = "test";
    }


}
