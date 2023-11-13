package com.green.vrink.suggest.service;

import com.green.vrink.suggest.dto.*;
import com.green.vrink.suggest.repository.model.Suggest;
import com.green.vrink.suggest.repository.model.SuggestReply;
import com.green.vrink.util.Criteria;

import java.util.List;

public interface SuggestService {
    Integer postSuggest(PostSuggestDto postSuggestDto);
    GetSuggestDto getSuggest(Integer suggestId);
    Integer patchSuggest(PatchSuggestDto patchSuggestDto);
    Integer deleteSuggest(Integer suggestId);
    Integer postSuggestReply(PostSuggestReplyDto postSuggestReplyDto);
    List<SuggestReplyDto> getSuggestReplyList(Integer suggestId, Criteria criteria);
    Integer getReplyCount(Integer suggestId);
    Integer patchSuggestReply(PatchSuggestReplyDto patchSuggestReplyDto);
    Integer deleteSuggestReply(Integer suggestId);
    Integer getTotal(Criteria criteria);
    List<GetSuggestDto> getSuggestList(Criteria criteria);
    Integer acceptSuggest(Integer suggestId);

    int getUserIdBySuggestId(Integer suggestId);
}
