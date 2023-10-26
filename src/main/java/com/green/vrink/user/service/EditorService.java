package com.green.vrink.user.service;

import com.green.vrink.user.dto.ApprovalDTO;
import com.green.vrink.user.repository.interfaces.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class EditorService {
    private final UserRepository userRepository;


    @Transactional
    public Integer requestApproval(ApprovalDTO approvalDTO) {




        return userRepository.requestApproval(approvalDTO);
    }

}
