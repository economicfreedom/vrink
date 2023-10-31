package com.green.vrink.community.repository.interfaces;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.community.repository.model.FreeBoardReply;
import com.green.vrink.util.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FreeBoardReplyRepository {

    Integer save(FreeBoardReply freeBoardReply);

    void update(FreeBoardReply freeBoardReply);

    void deleteById(Integer id);

    List<FreeBoardReplyDTO> findAllById(@Param("communityId")
                                        Integer communityId
                                      , @Param("cri")
                                        Criteria cri
    );

    Integer replyTotal(Integer commuId);

    Integer findUserIdByReplyId(Integer replyId);

}
