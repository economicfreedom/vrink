package com.green.vrink.community.service;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.repository.model.FreeBoard;

public interface FreeBoardService {

    Integer create(FreeBoardDTO freeBoardDTO);


    void delete(Integer communityId);

    FreeBoardDTO read(Integer communityId);

    void update(FreeBoardDTO freeBoardDTO);
}
