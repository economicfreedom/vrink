package com.green.vrink.message.service;

import com.green.vrink.message.dto.MessageDto;
import com.green.vrink.message.repository.interfaces.MessageRepository;
import com.green.vrink.user.repository.model.User;
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

        log.info("상대방 클릭시 이동 페이지에 현재 페이지 저장 후 메세지 발송 서비스 실행");
        
        try {
            User user = (User) session.getAttribute("USER");
            Integer userId = user.getUserId();
    
            MessageDto messageDto = MessageDto.builder()
                    .userId(userId)
                    .messageTo(receiverId)
                    .content(content)
                    .url(request.getRequestURL().toString())
                    .build();
            messageRepository.create(messageDto);
        } catch (Exception e) {
            log.info("에러 발생" + e);
        }


    }

    @Override
    public void sendMessageAndSaveBeforePage(Integer receiverId, String content) {

        log.info("상대방 클릭시 이동 페이지에 바로 전 페이지 저장 후 메세지 발송 서비스 실행");

        try {
            User user = (User) session.getAttribute("USER");
            Integer userId = user.getUserId();
            MessageDto messageDto = MessageDto.builder()
                    .userId(userId)
                    .messageTo(receiverId)
                    .content(content)
                    .url(request.getHeader("Referer"))
                    .build();
            messageRepository.create(messageDto);
        } catch (Exception e) {
            log.info("에러 발생" + e);
        }
    }

    @Override
    public void sendMessageAndSaveSpecificPage(Integer receiverId, String content, String url) {
        
        log.info("상대방 클릭시 이동 페이지에 임의 페이지 저장 후 메세지 발송 서비스 실행");

        try {
            User user = (User) session.getAttribute("USER");
            Integer userId = user.getUserId();
            MessageDto messageDto = MessageDto.builder()
                    .userId(userId)
                    .messageTo(receiverId)
                    .content(content)
                    .url(url)
                    .build();
            messageRepository.create(messageDto);
        } catch (Exception e) {
            log.info("에러 발생" + e);
        }

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
