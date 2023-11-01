package com.green.vrink.message.controller;

import com.green.vrink.message.dto.MessageDto;
import com.green.vrink.message.service.MessageService;
import com.green.vrink.user.repository.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;
import java.util.List;

@ControllerAdvice
@RequiredArgsConstructor
public class MessageControllerAdvice {

    private final HttpSession session;
    private final MessageService messageService;

    @ModelAttribute(name = "messageList")
    public List<MessageDto> getAllMessageList() {
        User user = (User) session.getAttribute("USER");
        if(user == null) {
            return null;
        }
        Integer userId = user.getUserId();
        if(userId == null) {
            return null;
        }
        List<MessageDto> messageDtoList = messageService.messageList(userId);
        for(MessageDto messageDto : messageDtoList) {
            messageDto.setCreatedAt(messageDto.getCreatedAt().substring(5, 16));
        }
        return messageDtoList;
    }

}
