package com.green.vrink.community.service;

import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.community.repository.interfaces.FreeBoardReplyRepository;
import com.green.vrink.community.repository.model.FreeBoardReply;
import com.green.vrink.util.Converter;
import com.green.vrink.util.Criteria;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class FreeBoardReplyServiceImpl implements FreeBoardReplyService {
    private final Converter<FreeBoardReplyDTO, FreeBoardReply> converter;
    private final FreeBoardReplyRepository freeBoardReplyRepository;
    @Override
    public Integer create(FreeBoardReplyDTO freeBoardReply) {
        FreeBoardReply entity = converter.toEntity(freeBoardReply);

        return freeBoardReplyRepository.save(entity);
    }

    @Override
    public void update(FreeBoardReplyDTO freeBoardReply) {
        FreeBoardReply entity = converter.toEntity(freeBoardReply);
        freeBoardReplyRepository.update(entity);


    }

    @Override
    public void delete(Integer replyId) {
        freeBoardReplyRepository.deleteById(replyId);
    }

    @Override
    public List<FreeBoardReplyDTO> readList(Integer communityId, Criteria cri) {
        return freeBoardReplyRepository.findAllById(communityId,cri);
    }

    @Override
    public Integer replyTotal(Integer commuId) {
        return freeBoardReplyRepository.replyTotal(commuId);
    }
}
