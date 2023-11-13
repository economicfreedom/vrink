package com.green.vrink.qna.service;

import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.qna.dto.AnswerDTO;
import com.green.vrink.util.Criteria;

import java.util.List;

public interface QnAService {


    Integer save(QuestionDTO qnADTO);
    QuestionDTO findById(Integer qnaId);
    void deleteById(Integer qnaId);


    Integer getTotal(Integer userId);

    List<QuestionDTO> list(Integer userId, Criteria cri);
    AnswerDTO getQuestion(Integer qnaId);

    Integer saveAnswer(AnswerDTO answerDTO);

    void updateStatus(Integer qnaId);

    Integer getUserId(Integer questionId);

    Integer getUserIdByQuestionId(Integer questionId);

}
