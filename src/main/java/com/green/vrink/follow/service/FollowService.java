package com.green.vrink.follow.service;

import com.green.vrink.follow.dto.FollowDto;
import com.green.vrink.follow.dto.GetFollowEditorDto;
import com.green.vrink.follow.repository.model.Follow;
import com.green.vrink.util.Criteria;

import java.util.List;

public interface FollowService {
    Integer follow(FollowDto followDto);
    List<Follow> getFollowList(Integer userId);
    Integer isFollow(FollowDto followDto);
    List<GetFollowEditorDto> getFollowEditorList(Criteria criteria);
    Integer getTotal(Criteria criteria);
}
