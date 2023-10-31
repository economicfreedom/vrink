package com.green.vrink.qna.service;

import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.qna.repository.model.Question;
import com.green.vrink.util.Converter;
import org.springframework.stereotype.Service;

@Service
public class QnAConverter implements Converter<QuestionDTO, Question> {

    @Override
    public QuestionDTO toDTO(Question question) {
        return QuestionDTO.builder()
                .questionId(question.getQuestionId())
                .userId(question.getUserId())
                .content(question.getContent())
                .createdAt(question.getCreatedAt())
                .type(question.getType())
                .title(question.getTitle())
                .email(question.getEmail())
                .build();


    }

    @Override
    public Question toEntity(QuestionDTO qnADTO) {
        return Question.builder()
                .questionId(qnADTO.getQuestionId())
                .userId(qnADTO.getUserId())
                .email(qnADTO.getEmail())
                .title(qnADTO.getTitle())
                .type(qnADTO.getType())
                .content(qnADTO.getContent())
                .createdAt(qnADTO.getCreatedAt())
                .build();
    }

}

