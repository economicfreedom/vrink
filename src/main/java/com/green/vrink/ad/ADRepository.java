package com.green.vrink.ad;

import com.green.vrink.admin.dto.AdminAdDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ADRepository {

    Integer save(ADUploadDTO adUploadDTO);
    String findAdImg();

    List<AdminAdDto> findRandMainAd();

    List<AdminAdDto> findRandSideAd();
}
