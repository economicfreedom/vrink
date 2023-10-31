package com.green.vrink.handler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ClassCastExceptionHandler {

    @ExceptionHandler(ClassCastException.class)
    public String handler(ClassCastException e){
        return "redirect:/";

    }
}
