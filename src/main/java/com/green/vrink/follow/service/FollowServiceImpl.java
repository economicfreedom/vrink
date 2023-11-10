package com.green.vrink.follow.service;

import com.green.vrink.follow.dto.FollowDto;
import com.green.vrink.follow.dto.GetFollowEditorDto;
import com.green.vrink.follow.repository.interfaces.FollowRepository;
import com.green.vrink.follow.repository.model.Follow;
import com.green.vrink.util.Criteria;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FollowServiceImpl implements FollowService {

    private final FollowRepository followRepository;

    @Override
    public Integer follow(FollowDto followDto) {
        int result = followRepository.follow(followDto);
        if (result != 1 ) {
            int unFollow = followRepository.unFollow(followDto);
            if (unFollow == 1) {
                return 2;
            }
            return 0;
        }
        return result;
    }

    @Override
    public List<Follow> getFollowList(Integer userId) {
        return followRepository.getFollowListByUserId(userId);
    }

    @Override
    public Integer isFollow(FollowDto followDto) {
        return followRepository.isFollow(followDto);
    }

    @Override
    public List<GetFollowEditorDto> getFollowEditorList(Criteria criteria) {
        return followRepository.findAllByCriteria(criteria);
    }

    @Override
    public Integer getTotal(Criteria criteria) {
        return followRepository.getTotal(criteria);
    }
}
