package com.green.vrink.user.controller;


import com.green.vrink.user.dto.ApprovalDTO;
import com.green.vrink.user.dto.EditorDTO;
import com.green.vrink.user.dto.EditorWriteDTO;
import com.green.vrink.user.service.EditorServiceImpl;

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
    private final EditorServiceImpl editorServiceImpl;
    @PostMapping("/apply-request")
    public ResponseEntity<?> apply(
            @RequestBody ApprovalDTO approvalDTO
            , HttpSession session
    ) {


//      session.getAttribute("asdf");


        approvalDTO.setUserId(1);


        Integer res =  editorServiceImpl.requestApproval(approvalDTO);


        log.info("Test Dto {}", approvalDTO);


        return ResponseEntity.ok().build();

    }
    
    @PostMapping("/editor-write")
    public Integer editorWriteProc(EditorWriteDTO editorWriteDTO) {
    	editorWriteDTO.setUserId(2);
    	Integer res = editorServiceImpl.requestEditorWrite(editorWriteDTO);
    	log.info("EditorWriteDTO {}",editorWriteDTO);
    	return res;
    }
    
    @PostMapping("/editor-edit")
    public Integer editorEidtProc(EditorDTO editorDTO) {
    	Integer res = editorServiceImpl.requestEditorEdit(editorDTO);
    	return res;
    }
}
