package com.green.vrink.qna.controller;

import com.green.vrink.qna.dto.QnADTO;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.qna.service.QnAService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RequestMapping("/qna")
@RestController
@Slf4j
@RequiredArgsConstructor
public class QnARestController {

    private final QnAService qnAService;

    @PostMapping("/save")
    public ResponseEntity<?> save(
            @Valid @RequestBody
            QnADTO qnADTO
            , BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.badRequest()
                    .body(bindingResult.getFieldError().getDefaultMessage());
        }
        Integer save = qnAService.save(qnADTO);

        if (save != 1) {
            return ResponseEntity.badRequest().build();
        }


        return ResponseEntity.ok().build();
    }

    @PostMapping("/save-question")
    public ResponseEntity<?> saveQuestion(
            @RequestBody
            QuestionDTO questionDTO) {
        Integer res = qnAService.saveQuestion(questionDTO);
        if (res != 1) {
            return ResponseEntity.badRequest().build();
        }
        qnAService.updateStatus(questionDTO.getQnaId());
        return ResponseEntity.ok().build();
    }

}
