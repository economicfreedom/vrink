package com.green.vrink.qna.controller;

import com.green.vrink.message.service.MessageService;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.qna.dto.AnswerDTO;
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
    private final MessageService messageService;

    @PostMapping("/save")
    public ResponseEntity<?> save(
            @Valid @RequestBody
            QuestionDTO qnADTO
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

    @PostMapping("/save-answer")
    public ResponseEntity<?> saveQuestion(
            @Valid
            @RequestBody
            AnswerDTO answerDTO
            , BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            String defaultMessage = bindingResult.getFieldError().getDefaultMessage();
            return ResponseEntity.badRequest().body(defaultMessage);
        }
        Integer res = qnAService.saveQuestion(answerDTO);
        if (res != 1) {
            return ResponseEntity.badRequest().build();
        }
        Integer userId = qnAService.getUserIdByQuestionId(answerDTO.getQuestionId());
        qnAService.updateStatus(answerDTO.getQuestionId());

        Integer questionId = answerDTO.getQuestionId();;
        String message ="문의 하신 내용에 답변이 달렸어요";
        String url = "/qna/read-q/"+questionId;
        messageService.sendMessageAndSaveSpecificPage(userId,message,url);
        return ResponseEntity.ok().build();
    }

}
