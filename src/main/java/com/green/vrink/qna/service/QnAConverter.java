package com.green.vrink.qna.service;

import com.green.vrink.qna.dto.QnADTO;
import com.green.vrink.qna.repository.model.QnA;
import com.green.vrink.util.Converter;
import org.springframework.stereotype.Service;

@Service
public class QnAConverter implements Converter<QnADTO, QnA> {

    @Override
    public QnADTO toDTO(QnA qnA) {
        return QnADTO.builder()
                .qnaId(qnA.getQnaId())
                .userId(qnA.getUserId())
                .content(qnA.getContent())
                .createdAt(qnA.getCreatedAt())
                .type(qnA.getType())
                .title(qnA.getTitle())
                .email(qnA.getEmail())
                .build();


    }

    @Override
    public QnA toEntity(QnADTO qnADTO) {
        return QnA.builder()
                .qnaId(qnADTO.getQnaId())
                .userId(qnADTO.getUserId())
                .email(qnADTO.getEmail())
                .title(qnADTO.getTitle())
                .type(qnADTO.getType())
                .content(qnADTO.getContent())
                .createdAt(qnADTO.getCreatedAt())
                .build();
    }
}
