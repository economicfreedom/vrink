package com.green.vrink.suggest.repository.interfaces;

import com.green.vrink.suggest.dto.PatchSuggestDto;
import com.green.vrink.suggest.dto.PostSuggestDto;
import com.green.vrink.suggest.repository.model.Suggest;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SuggestRepository {
    Integer postSuggest(PostSuggestDto postSuggestDto);
    Suggest getSuggest(Integer suggestId);
    Integer patchSuggest(PatchSuggestDto patchSuggestDto);
    Integer deleteSuggest(Integer suggestId);
}
