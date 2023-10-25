package com.green.vrink.user.service;

import com.green.vrink.user.dto.TestDTO;
import com.green.vrink.user.repository.interfaces.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class EditorService {
    private final UserRepository userRepository;

    public Integer requestApproval(TestDTO testDTO) {

        userRepository.requestApproval(testDTO);


        return 1;
    }
}
