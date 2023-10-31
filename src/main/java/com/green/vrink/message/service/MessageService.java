package com.green.vrink.message.service;

import com.green.vrink.message.dto.MessageDto;
import java.util.List;

public interface MessageService {

    void sendMessageAndSaveNowPage(Integer receiverId, String content);
    void sendMessageAndSaveBeforePage(Integer receiverId, String content);
    void sendMessageAndSaveSpecificPage(Integer receiverId, String content, String url);
    void delete(Integer messageId);
    void update(Integer messageId);
    List<MessageDto> messageList(Integer userId);
}
