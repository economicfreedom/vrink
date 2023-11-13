package com.green.vrink.notice.repository.interfaces;

import com.green.vrink.notice.dto.NoticeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeRepository {

    List<NoticeDto> findNoticeListByType(String type);

}
