package com.green.vrink.community.service;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.repository.model.FreeBoard;
import com.green.vrink.util.Converter;
import org.springframework.stereotype.Service;

@Service("freeBoardConverter")
public class FreeBoardConverter implements Converter<FreeBoardDTO, FreeBoard> {



    @Override
    public FreeBoardDTO toDTO(FreeBoard freeBoard) {
        return FreeBoardDTO
                .builder()
                .communityId(freeBoard.getCommunityId())
                .userId(freeBoard.getUserId())
                .title(freeBoard.getTitle())
                .content(freeBoard.getContent())
                .createdAt(freeBoard.getCreatedAt())
                .build();
    }

    @Override
    public FreeBoard toEntity(FreeBoardDTO freeBoardDTO) {
        return FreeBoard
                .builder()
                .communityId(freeBoardDTO.getCommunityId())
                .userId(freeBoardDTO.getUserId())
                .title(freeBoardDTO.getTitle())
                .content(freeBoardDTO.getContent())
                .createdAt(freeBoardDTO.getCreatedAt())
                .build();
    }

}
