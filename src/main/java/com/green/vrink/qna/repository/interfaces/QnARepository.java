package com.green.vrink.qna.repository.interfaces;


import com.green.vrink.qna.dto.QnADTO;
import com.green.vrink.qna.dto.QuestionDTO;
import com.green.vrink.qna.repository.model.QnA;
import com.green.vrink.util.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QnARepository {


    Integer save(QnA qnA);
    QnADTO findById(Integer qnaId);
    void deleteById(Integer qnaId);

    Integer findTotalById(Integer userId);

    List<QnADTO> findAllById(@Param("userId") Integer userId, @Param("cri") Criteria cri);
    QuestionDTO findByQuestionByQnAId(Integer qnaId);

    Integer saveQuestion(QuestionDTO questionDTO);

    void updateStatus(Integer qnaId);
}
