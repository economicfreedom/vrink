package com.green.vrink.reply.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/reply")
@Slf4j
@RequiredArgsConstructor
public class ReplyRestController {


    @PostMapping("/save")
    public ResponseEntity<?> replySave(){

        return null;
    }
}
