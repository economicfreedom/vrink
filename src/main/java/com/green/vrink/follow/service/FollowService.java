package com.green.vrink.follow.service;

import com.green.vrink.follow.dto.FollowDto;
import com.green.vrink.follow.repository.model.Follow;

import java.util.List;

public interface FollowService {
    Integer follow(FollowDto followDto);
    List<Follow> getFollowList(Integer userId);
    Integer isFollow(FollowDto followDto);
}
