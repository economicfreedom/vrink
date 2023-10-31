package com.green.vrink.community.service;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.repository.model.FreeBoard;
import com.green.vrink.util.Criteria;

import java.util.List;

public interface FreeBoardService {

    Integer create(FreeBoardDTO freeBoardDTO);


    void delete(Integer communityId);

    FreeBoardDTO read(Integer communityId);

    void update(FreeBoardDTO freeBoardDTO);

    Integer getTotal(Criteria cri);

    List<FreeBoardDTO> pageList(Criteria cri);

    Integer getUserId(Integer commuId);
}
