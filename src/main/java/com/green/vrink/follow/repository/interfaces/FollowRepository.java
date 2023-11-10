package com.green.vrink.follow.repository.interfaces;

import com.green.vrink.follow.dto.FollowDto;
import com.green.vrink.follow.repository.model.Follow;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FollowRepository {
    Integer follow(FollowDto followDto);
    Integer unFollow(FollowDto followDto);
    List<Follow> getFollowListByUserId(Integer userId);
    Integer isFollow(FollowDto followDto);
    Integer countFollower(Integer editorId);
}
