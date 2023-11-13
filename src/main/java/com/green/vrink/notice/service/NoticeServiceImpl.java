package com.green.vrink.notice.service;


import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.notice.repository.interfaces.NoticeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class NoticeServiceImpl implements NoticeService{

    private final NoticeRepository noticeRepository;

    @Override
    public List<NoticeDto> noticeList(String type) {
        return noticeRepository.findNoticeListByType(type);
    }
}
