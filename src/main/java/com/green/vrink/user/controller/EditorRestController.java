package com.green.vrink.user.controller;


import com.green.vrink.user.dto.TestDTO;
import com.green.vrink.user.service.EditorService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/editor")
@Slf4j

@RequiredArgsConstructor
public class EditorRestController {
    private final EditorService editorService;
    @PostMapping("/apply-request")
    public ResponseEntity<?> apply(
            @RequestBody TestDTO testDTO
            , HttpSession session
    ) {


//      session.getAttribute("asdf");

        testDTO.setUserId(1);
        Integer res =  editorService.requestApproval(testDTO);



        log.info("Test Dto {}", testDTO);


        return ResponseEntity.ok().build();

    }


}
