package com.green.vrink.ad;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ADRepository {

    Integer save(ADUploadDTO adUploadDTO);
    String findAdImg();
}
