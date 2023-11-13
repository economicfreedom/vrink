package com.green.vrink.notice.service;

import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.util.Criteria;

import java.util.List;

public interface NoticeService {
    Integer getTotal(Criteria criteria);
    List<NoticeDto> getNoticeList(Criteria criteria);

    NoticeDto getNotice(int noticeId);
}
