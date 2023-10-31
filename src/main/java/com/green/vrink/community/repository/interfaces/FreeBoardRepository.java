package com.green.vrink.community.repository.interfaces;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.repository.model.FreeBoard;
import com.green.vrink.util.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FreeBoardRepository {

    Integer save(FreeBoard freeBoard);


    void delete(Integer communityId);


    FreeBoard findById(Integer communityId);


    void update(FreeBoard entity);
    List<FreeBoardDTO> findAllByCri(Criteria cri);

    Integer getTotal(Criteria cri);

    Integer findUserIdByCommunityId(Integer commuId);
}
