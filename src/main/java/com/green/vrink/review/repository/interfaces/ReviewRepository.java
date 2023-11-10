package com.green.vrink.review.repository.interfaces;

import com.green.vrink.review.dto.ReviewCountDTO;
import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.repository.model.Review;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReviewRepository {

    Integer reviewSave(Review review);

    Integer reviewDuplicCheck(Review review);


    List<ReviewDTO> findByIdAll(Integer id);

    void deleteById(Integer reviewId);

    Integer findUserIdByReviewId(Integer reviewId);

    List<ReviewCountDTO> findByAll();

    boolean isTableExists(
             @Param("userId") Integer userId
            , @Param("editorId") Integer editorId);

}
