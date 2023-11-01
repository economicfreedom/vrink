package com.green.vrink.suggest.service;

import com.green.vrink.suggest.dto.PatchSuggestDto;
import com.green.vrink.suggest.dto.PostSuggestDto;
import com.green.vrink.suggest.repository.model.Suggest;

public interface SuggestService {
    Integer postSuggest(PostSuggestDto postSuggestDto);
    Suggest getSuggest(Integer suggestId);
    Integer patchSuggest(PatchSuggestDto patchSuggestDto);
    Integer deleteSuggest(Integer suggestId);
}
