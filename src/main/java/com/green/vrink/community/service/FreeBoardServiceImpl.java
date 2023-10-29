package com.green.vrink.community.service;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.repository.interfaces.FreeBoardRepository;
import com.green.vrink.community.repository.model.FreeBoard;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.util.Converter;
import com.green.vrink.util.Criteria;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class FreeBoardServiceImpl implements FreeBoardService {

    private final FreeBoardRepository freeBoardRepository;
    private final  Converter<FreeBoardDTO, FreeBoard> converter;
    private final UserRepository userRepository;

    @Transactional
    @Override
    public Integer create(FreeBoardDTO freeBoardDTO) {
        FreeBoard entity = converter.toEntity(freeBoardDTO);




        return freeBoardRepository.save(entity);
    }
    @Transactional
    @Override
    public void delete(Integer communityId) {
        freeBoardRepository.delete(communityId);
    }
    @Transactional
    @Override
    public FreeBoardDTO read(Integer communityId) {

        FreeBoard freeBoard = freeBoardRepository.findById(communityId);

        if (freeBoard==null){
            return null;
        }

        log.info("freeboard {}",freeBoard);
        FreeBoardDTO dto = converter.toDTO(freeBoard);
        String userNickname = userRepository.findUserNicknameById(freeBoard.getUserId());

        dto.setNickname(userNickname);
        return dto;
    }
    @Transactional
    @Override
    public void update(FreeBoardDTO freeBoardDTO) {
        FreeBoard entity = converter.toEntity(freeBoardDTO);

        freeBoardRepository.update(entity);
    }
    @Transactional
    @Override
    public Integer getTotal(Criteria cri) {
        return freeBoardRepository.getTotal(cri);
    }
    @Transactional
    @Override
    public List<FreeBoardDTO> pageList(Criteria cri) {
        return freeBoardRepository.findAllByCri(cri);
    }
}
