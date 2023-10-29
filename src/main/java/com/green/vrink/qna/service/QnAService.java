package com.green.vrink.qna.service;

import com.green.vrink.qna.dto.QnADTO;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.qna.repository.model.QnA;
import com.green.vrink.util.Criteria;

import java.util.List;

public interface QnAService {


    Integer save(QnADTO qnADTO);
    QnADTO findById(Integer qnaId);
    void deleteById(Integer qnaId);


    Integer getTotal(Integer userId);

    List<QnADTO> list(Integer userId, Criteria cri);
    QuestionDTO getQuestion(Integer qnaId);

    Integer saveQuestion(QuestionDTO questionDTO);

    void updateStatus(Integer qnaId);

}
