package com.green.vrink.user.controller;


import com.green.vrink.user.dto.ApprovalDTO;
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
            @RequestBody ApprovalDTO approvalDTO
            , HttpSession session
    ) {


//      session.getAttribute("asdf");


        approvalDTO.setUserId(1);


        Integer res =  editorService.requestApproval(approvalDTO);


        log.info("Test Dto {}", approvalDTO);


        return ResponseEntity.ok().build();

    }


}
