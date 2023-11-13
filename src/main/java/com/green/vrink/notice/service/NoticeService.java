package com.green.vrink.notice.service;


import com.green.vrink.notice.dto.NoticeDto;

import java.util.List;

public interface NoticeService {

    List<NoticeDto> noticeList(String type);
}
