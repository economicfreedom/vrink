package com.green.vrink.suggest.service;

import com.green.vrink.suggest.dto.PatchSuggestDto;
import com.green.vrink.suggest.dto.PostSuggestDto;
import com.green.vrink.suggest.repository.interfaces.SuggestRepository;
import com.green.vrink.suggest.repository.model.Suggest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        return suggestRepository.patchSuggest(patchSuggestDto);
    }

    @Override
    public Integer deleteSuggest(Integer suggestId) {
        return suggestRepository.deleteSuggest(suggestId);
    }
}
