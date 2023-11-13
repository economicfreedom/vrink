package com.green.vrink.notice.service;

import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.notice.repository.interfaces.NoticeRepository;
import com.green.vrink.util.Criteria;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
    private final NoticeRepository noticeRepository;
    @Override
    public Integer getTotal(Criteria criteria) {
        return noticeRepository.getTotal(criteria);
    }

    @Override
    public List<NoticeDto> getNoticeList(Criteria criteria) {
        return noticeRepository.findAllByCriteria(criteria);
    }

    @Override
    public NoticeDto getNotice(int noticeId) {
        return noticeRepository.findByNoticeId(noticeId);
    }
        @Override
    public List<NoticeDto> noticeList(String type) {
        return noticeRepository.findNoticeListByType(type);
    }
}
