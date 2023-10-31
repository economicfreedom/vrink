package com.green.vrink.qna.repository.interfaces;


import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.qna.dto.AnswerDTO;
import com.green.vrink.qna.repository.model.Question;
import com.green.vrink.util.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QnARepository {


    Integer save(Question question);
    QuestionDTO findById(Integer qnaId);
    void deleteById(Integer qnaId);

    Integer findTotalById(Integer userId);

    List<QuestionDTO> findAllById(@Param("userId") Integer userId, @Param("cri") Criteria cri);
    AnswerDTO findByAnswerByQuestionId(Integer questionId);

    Integer saveAnswer(AnswerDTO answerDTO);

    void updateStatus(Integer qnaId);

    Integer findUserIdByQuestionId(Integer questionId);
}
