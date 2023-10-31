package com.green.vrink.review.service;


import com.green.vrink.review.dto.ReviewDTO;

import java.util.List;

public interface ReviewService {

    Integer save(ReviewDTO reviewDTO);
    Integer duplicationCheck(ReviewDTO reviewDTO);

    List<ReviewDTO> findByIdAll(Integer id);
    Integer getReviewUserId(Integer reviewId);
    void delete(Integer reviewId);

}
