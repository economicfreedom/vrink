package com.green.vrink.review.service;

import com.green.vrink.review.dto.ReviewCountDTO;
import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.repository.interfaces.ReviewRepository;
import com.green.vrink.review.repository.model.Review;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewServiceImpl implements ReviewService {
    private final ReviewRepository replyRepository;
    @Override
    public Integer save(ReviewDTO reviewDTO) {
        Review entity = Review.builder()
                .userId(reviewDTO.getUserId())
                .editorId(reviewDTO.getEditorId())
                .content(reviewDTO.getContent())
                .count(reviewDTO.getCount())
                .build();

        replyRepository.minusCount(reviewDTO.getUserId(), reviewDTO.getEditorId());

        Integer i = replyRepository.reviewSave(entity);



        return replyRepository.reviewSave(entity);
    }

    @Override
    public Integer duplicationCheck(ReviewDTO reviewDTO) {
        Review entity = Review.builder()
                .userId(reviewDTO.getUserId())
                .editorId(reviewDTO.getEditorId())
                .content(reviewDTO.getContent())
                .count(reviewDTO.getCount())
                .build();

//        replyRepository.reviewDuplicCheck(entity);
        return null;
    }

    @Override
    public List<ReviewDTO> findByIdAll(Integer id) {

        return replyRepository.findByIdAll(id);
    }

    @Override
    public void delete(Integer reviewId) {
        replyRepository.deleteById(reviewId);
    }

    @Override
    public Integer getReviewUserId(Integer reviewId) {
        return replyRepository.findUserIdByReviewId(reviewId);
    }

    @Override
    public List<ReviewCountDTO> getList() {
        return replyRepository.findByAll();
    }

    @Override
    public boolean hasReviewCount(Integer userId, int editorId) {

        Integer tableExists = replyRepository.isTableExists(userId, editorId);

        Integer count = replyRepository.findCountByUserIdAndEditorId(userId, editorId);

        if (tableExists != null){
            if (count >= 1){
                return true;
            }
        }

        return false;
    }
}
