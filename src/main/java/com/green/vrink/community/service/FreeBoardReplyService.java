package com.green.vrink.community.service;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.util.Criteria;

import java.util.List;

public interface FreeBoardReplyService {

    Integer create(FreeBoardReplyDTO freeBoardReply);
    void update(FreeBoardReplyDTO freeBoardReply);
    void delete(Integer replyId);
    List<FreeBoardReplyDTO> readList(Integer communityId, Criteria cri);
    Integer replyTotal(Integer commuId);



}
