package com.green.vrink.suggest.repository.interfaces;

import com.green.vrink.suggest.dto.*;
import com.green.vrink.suggest.repository.model.Suggest;
import com.green.vrink.util.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SuggestRepository {
    Integer postSuggest(PostSuggestDto postSuggestDto);
    GetSuggestDto getSuggest(Integer suggestId);
    Integer patchSuggest(PatchSuggestDto patchSuggestDto);
    Integer deleteSuggest(Integer suggestId);
    Integer postSuggestReply(PostSuggestReplyDto postSuggestReplyDto);
    Integer getReplyCount(Integer suggestId);
    List<SuggestReplyDto> getSuggestReplyListBySuggestId(@Param("suggestId") Integer suggestId, @Param("criteria") Criteria criteria);
    Integer patchSuggestReply(PatchSuggestReplyDto patchSuggestReplyDto);
    Integer deleteSuggestReply(Integer replyId);
    Integer getTotal(Criteria criteria);
    List<GetSuggestDto> getSuggestList(Criteria criteria);
    Integer acceptSuggest(Integer suggestId);
}
