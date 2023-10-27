package com.green.vrink.community.service;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.repository.interfaces.FreeBoardRepository;
import com.green.vrink.community.repository.model.FreeBoard;
import com.green.vrink.user.repository.interfaces.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class FreeBoardServiceImpl implements FreeBoardService {

    private final FreeBoardRepository freeBoardRepository;
    private final FreeBoardConverter freeBoardConverter;
    private final UserRepository userRepository;
    @Override
    public Integer create(FreeBoardDTO freeBoardDTO) {
        FreeBoard entity = freeBoardConverter.toEntity(freeBoardDTO);




        return freeBoardRepository.save(entity);
    }

    @Override
    public void delete(Integer communityId) {
        freeBoardRepository.delete(communityId);
    }

    @Override
    public FreeBoardDTO read(Integer communityId) {

        FreeBoard freeBoard = freeBoardRepository.findById(communityId);

        if (freeBoard==null){
            return null;
        }

        log.info("freeboard {}",freeBoard);
        FreeBoardDTO dto = freeBoardConverter.toDTO(freeBoard);
        String userNickname = userRepository.findUserNicknameById(freeBoard.getUserId());

        dto.setNickname(userNickname);
        return dto;
    }
}
