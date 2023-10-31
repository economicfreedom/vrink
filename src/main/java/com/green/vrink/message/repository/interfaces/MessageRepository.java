package com.green.vrink.message.repository.interfaces;

import com.green.vrink.message.dto.MessageDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MessageRepository {
    Integer create(MessageDto messageDto);
    void delete(Integer messageId);
    void update(Integer messageId);
    List<MessageDto> messageList(Integer userId);
}
