package com.green.vrink.community.service;

import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.community.repository.model.FreeBoardReply;
import com.green.vrink.util.Converter;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardReplyConverter implements Converter<FreeBoardReplyDTO, FreeBoardReply> {

    @Override
    public FreeBoardReplyDTO toDTO(FreeBoardReply freeBoardReply) {
        return FreeBoardReplyDTO.builder()
                .replyId(freeBoardReply.getReplyId())
                .communityId(freeBoardReply.getCommunityId())
                .userId(freeBoardReply.getUserId())
                .content(freeBoardReply.getContent())
                .createdAt(freeBoardReply.getCreatedAt())
                .nickname(freeBoardReply.getNickname())
                .build();
    }

    @Override
    public FreeBoardReply toEntity(FreeBoardReplyDTO freeBoardReplyDTO) {
        return FreeBoardReply.builder()
                .replyId(freeBoardReplyDTO.getReplyId())
                .communityId(freeBoardReplyDTO.getCommunityId())
                .userId(freeBoardReplyDTO.getUserId())
                .content(freeBoardReplyDTO.getContent())
                .createdAt(freeBoardReplyDTO.getCreatedAt())
                .nickname(freeBoardReplyDTO.getNickname())
                .build();
    }
}
