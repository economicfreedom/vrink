package com.green.vrink.qna.service;

import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.qna.dto.AnswerDTO;
import com.green.vrink.qna.repository.interfaces.QnARepository;
import com.green.vrink.qna.repository.model.Question;
import com.green.vrink.util.Converter;
import com.green.vrink.util.Criteria;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j

public class QnAServiceImpl implements QnAService {

    private final Converter<QuestionDTO, Question> converter;
    private final QnARepository qnARepository;

    @Override
    public Integer save(QuestionDTO qnADTO) {
        Question entity = converter.toEntity(qnADTO);

        return qnARepository.save(entity);
    }

    @Override
    public QuestionDTO findById(Integer qnaId) {

        return qnARepository.findById(qnaId);

    }

    @Override
    public void deleteById(Integer qnaId) {

    }

    @Override
    public Integer getTotal(Integer userId) {
        return qnARepository.findTotalById(userId);

    }

    @Override
    public List<QuestionDTO> list(Integer userId, Criteria cri) {
        return qnARepository.findAllById(userId, cri);
    }

    @Override
    public AnswerDTO getQuestion(Integer qnaId) {
        return qnARepository.findByAnswerByQuestionId(qnaId);
    }

    @Override
    public Integer saveAnswer(AnswerDTO answerDTO) {

        return   qnARepository.saveAnswer(answerDTO);
    }

    @Override
    public void updateStatus(Integer qnaId) {
        qnARepository.updateStatus(qnaId);
    }

    @Override
    public Integer getUserId(Integer questionId) {
        return qnARepository.findUserIdByQuestionId(questionId);
    }

    @Override
    public Integer getUserIdByQuestionId(Integer questionId) {
        return qnARepository.findUserIdByQuestionId(questionId);
    }
}
