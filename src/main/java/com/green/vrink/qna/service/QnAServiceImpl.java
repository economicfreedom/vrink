package com.green.vrink.qna.service;

import com.green.vrink.qna.dto.QnADTO;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.qna.repository.interfaces.QnARepository;
import com.green.vrink.qna.repository.model.QnA;
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

    private final Converter<QnADTO, QnA> converter;
    private final QnARepository qnARepository;

    @Override
    public Integer save(QnADTO qnADTO) {
        QnA entity = converter.toEntity(qnADTO);

        return qnARepository.save(entity);
    }

    @Override
    public QnADTO findById(Integer qnaId) {

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
    public List<QnADTO> list(Integer userId, Criteria cri) {
        return qnARepository.findAllById(userId, cri);
    }

    @Override
    public QuestionDTO getQuestion(Integer qnaId) {
        return qnARepository.findByQuestionByQnAId(qnaId);
    }

    @Override
    public Integer saveQuestion(QuestionDTO questionDTO) {

        return   qnARepository.saveQuestion(questionDTO);
    }

    @Override
    public void updateStatus(Integer qnaId) {
        qnARepository.updateStatus(qnaId);
    }
}
