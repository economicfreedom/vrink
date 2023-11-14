package com.green.vrink.ad;

import com.green.vrink.admin.dto.AdminAdDto;

import java.util.List;

public interface ADService {

    Integer save(ADUploadDTO adUploadDTO);

    String getAdImg();

    List<AdminAdDto> getMainAdList();

    AdminAdDto getSideAdList();
}
