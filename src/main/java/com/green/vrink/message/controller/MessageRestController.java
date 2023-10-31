package com.green.vrink.message.controller;

import com.green.vrink.message.service.MessageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/message")
@Slf4j
@RequiredArgsConstructor
public class MessageRestController {

    private final MessageService messageService;

    @Transactional
    @PutMapping("/check-message")
    public ResponseEntity<Integer> checkMessage(@RequestHeader("messageId") Integer messageId) {

        log.info("메시지 확인 상태 변경 레스트 컨트롤러 실행");

        messageService.update(messageId);
        return ResponseEntity.status(HttpStatus.OK).body(200);

    }

}
