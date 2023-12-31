package com.green.vrink.follow.repository.interfaces;

import com.green.vrink.follow.dto.FollowDto;
import com.green.vrink.follow.dto.GetFollowEditorDto;
import com.green.vrink.follow.repository.model.Follow;
import com.green.vrink.util.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FollowRepository {
    Integer follow(FollowDto followDto);
    Integer unFollow(FollowDto followDto);
    List<Follow> getFollowListByUserId(Integer userId);
    Integer isFollow(FollowDto followDto);
    Integer countFollower(Integer editorId);
    List<GetFollowEditorDto> findAllByCriteria(Criteria criteria);
    Integer getTotal(Criteria criteria);
}
