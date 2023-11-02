package com.green.vrink.suggest.repository.interfaces;

import com.green.vrink.suggest.dto.PatchSuggestDto;
import com.green.vrink.suggest.dto.PostSuggestDto;
import com.green.vrink.suggest.dto.PostSuggestReplyDto;
import com.green.vrink.suggest.repository.model.Suggest;
import com.green.vrink.suggest.repository.model.SuggestReply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SuggestRepository {
    Integer postSuggest(PostSuggestDto postSuggestDto);
    Suggest getSuggest(Integer suggestId);
    Integer patchSuggest(PatchSuggestDto patchSuggestDto);
    Integer deleteSuggest(Integer suggestId);
    Integer postSuggestReply(PostSuggestReplyDto postSuggestReplyDto);
    Integer getReplyCount(Integer suggestId);
    List<SuggestReply> getSuggestReplyListBySuggestId(Integer suggestId);
}
