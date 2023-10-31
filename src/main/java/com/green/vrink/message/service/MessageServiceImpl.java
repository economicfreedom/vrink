package com.green.vrink.message.service;

import com.green.vrink.message.dto.MessageDto;
import com.green.vrink.message.repository.interfaces.MessageRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService {

    private final MessageRepository messageRepository;
    private final HttpSession session;
    private final HttpServletRequest request;

    @Transactional
    @Override
    public void sendMessageAndSaveNowPage(Integer receiverId, String content) {

        MessageDto messageDto = MessageDto.builder()
                .userId(3)
                .messageTo(receiverId)
                .content(content)
                .url(request.getRequestURL().toString())
                .build();
        messageRepository.create(messageDto);

    }

    @Override
    public void sendMessageAndSaveBeforePage(Integer receiverId, String content) {
        MessageDto messageDto = MessageDto.builder()
                .userId(3)
                .messageTo(receiverId)
                .content(content)
                .url(request.getHeader("Referer"))
                .build();
        messageRepository.create(messageDto);
    }

    @Override
    public void sendMessageAndSaveSpecificPage(Integer receiverId, String content, String url) {
        MessageDto messageDto = MessageDto.builder()
                .userId(3)
                .messageTo(receiverId)
                .content(content)
                .url(url)
                .build();
        messageRepository.create(messageDto);
    }

    @Transactional
    @Override
    public void delete(Integer messageId) {
        messageRepository.delete(messageId);
    }

    @Override
    public void update(Integer messageId) {
        messageRepository.update(messageId);
    }

    @Transactional
    @Override
    public List<MessageDto> messageList(Integer userId) {
        return messageRepository.messageList(userId);
    }
}
