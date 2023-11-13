package com.green.vrink.notice.repository.interfaces;

import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.util.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeRepository {
    Integer getTotal(Criteria criteria);

    List<NoticeDto> findAllByCriteria(Criteria criteria);

    NoticeDto findByNoticeId(int noticeId);
}
