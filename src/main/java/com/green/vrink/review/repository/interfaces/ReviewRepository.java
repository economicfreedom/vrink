package com.green.vrink.review.repository.interfaces;

import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.repository.model.Review;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewRepository {

    Integer reviewSave(Review review);
    Integer reviewDuplicCheck(Review review);


    List<ReviewDTO> findByIdAll(Integer id);

    void deleteById(Integer reviewId);

    Integer findUserIdByReviewId(Integer reviewId);
}
