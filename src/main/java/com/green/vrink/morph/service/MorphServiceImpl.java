package com.green.vrink.morph.service;

import com.green.vrink.morph.repository.MorphRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j

public class MorphServiceImpl implements MorphService {

    private final MorphRepository morphRepository;
    @Override
    public String getMorph(Integer editorId) {
        return morphRepository.findByEditorId(editorId);
    }
}
