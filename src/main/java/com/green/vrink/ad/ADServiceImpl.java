package com.green.vrink.ad;

import com.green.vrink.admin.dto.AdminAdDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ADServiceImpl implements ADService {
    private final ADRepository adRepository;
    @Override
    public Integer save(ADUploadDTO adUploadDTO) {
        return adRepository.save(adUploadDTO);
    }

    @Override
    public String getAdImg() {
        return adRepository.findAdImg();
    }

    @Override
    public List<AdminAdDto> getMainAdList() {
        return adRepository.findRandMainAd();
    }

    @Override
    public List<AdminAdDto> getSideAdList() {
        return adRepository.findRandSideAd();
    }
}
