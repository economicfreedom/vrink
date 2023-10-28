package com.green.vrink.community.repository.interfaces;

import com.green.vrink.community.repository.model.FreeBoard;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FreeBoardRepository {

    Integer save(FreeBoard freeBoard);


    void delete(Integer communityId);


    FreeBoard findById(Integer communityId);


    void update(FreeBoard entity);

}
