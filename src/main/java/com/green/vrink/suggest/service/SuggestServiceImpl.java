package com.green.vrink.suggest.service;

import com.green.vrink.suggest.dto.*;
import com.green.vrink.suggest.repository.interfaces.SuggestRepository;
import com.green.vrink.suggest.repository.model.Suggest;
import com.green.vrink.suggest.repository.model.SuggestReply;
import com.green.vrink.util.Criteria;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SuggestServiceImpl implements SuggestService{

    private final SuggestRepository suggestRepository;
    @Transactional
    @Override
    public Integer postSuggest(PostSuggestDto postSuggestDto) {
        return suggestRepository.postSuggest(postSuggestDto);
    }

    @Override
    public GetSuggestDto getSuggest(Integer suggestId) {
        return suggestRepository.getSuggest(suggestId);
    }

    @Override
    public Integer patchSuggest(PatchSuggestDto patchSuggestDto) {
        return suggestRepository.patchSuggest(patchSuggestDto);}

    @Override
    public Integer deleteSuggest(Integer suggestId) {
        return suggestRepository.deleteSuggest(suggestId);
    }

    @Transactional
    @Override
    public Integer postSuggestReply(PostSuggestReplyDto postSuggestReplyDto) {
        return suggestRepository.postSuggestReply(postSuggestReplyDto);
    }

    @Override
    public List<SuggestReplyDto> getSuggestReplyList(Integer suggestId, Criteria criteria) {
        return suggestRepository.getSuggestReplyListBySuggestId(suggestId, criteria);
    }

    @Override
    public Integer getReplyCount(Integer suggestId) {
        return suggestRepository.getReplyCount(suggestId);
    }

    @Override
    public Integer patchSuggestReply(PatchSuggestReplyDto patchSuggestReplyDto) {
        return suggestRepository.patchSuggestReply(patchSuggestReplyDto);
    }

    @Override
    public Integer deleteSuggestReply(Integer suggestId) {

        return suggestRepository.deleteSuggestReply(suggestId);
    }

    @Override
    public Integer getTotal(Criteria criteria) {
        return suggestRepository.getTotal(criteria);
    }

    @Override
    public List<GetSuggestDto> getSuggestList(Criteria criteria) {
        return suggestRepository.findAllByCriteria(criteria);
    }

    @Override
    public Integer acceptSuggest(Integer suggestId) {

        Integer state = suggestRepository.findStateById(suggestId);

        if (state.intValue() ==0){

            suggestRepository.acceptSuggest(suggestId);
            return 0;
        }

        return 1;
    }

    @Override
    public int getUserIdBySuggestId(Integer suggestId) {

        return suggestRepository.findUserIdBySuggestId(suggestId);
    }
}
