package com.green.vrink.suggest.service;

import com.green.vrink.suggest.dto.PatchSuggestDto;
import com.green.vrink.suggest.dto.PostSuggestDto;
import com.green.vrink.suggest.dto.PostSuggestReplyDto;
import com.green.vrink.suggest.repository.interfaces.SuggestRepository;
import com.green.vrink.suggest.repository.model.Suggest;
import com.green.vrink.suggest.repository.model.SuggestReply;
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
    public Suggest getSuggest(Integer suggestId) {
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
    public List<SuggestReply> getSuggestReplyList(Integer suggestId) {
        return suggestRepository.getSuggestReplyListBySuggestId(suggestId);
    }
}
