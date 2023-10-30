package com.green.vrink.user.controller;


import com.green.vrink.user.dto.ApprovalDTO;
import com.green.vrink.user.dto.EditorDTO;
import com.green.vrink.user.dto.EditorPriceListDTO;
import com.green.vrink.user.dto.EditorWriteDTO;
import com.green.vrink.user.service.EditorServiceImpl;

import com.green.vrink.util.AsyncPageDTO;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

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

    @GetMapping("/list-more")
    public ResponseEntity<?> listMore(
            @RequestParam(name = "page-num") Integer pageNum
    ){
                Criteria cri = new Criteria();
        cri.setPageNum(pageNum);
        cri.setCountPerPage(6);
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        Integer total = editorServiceImpl.getTotal();
        pageDTO.setArticleTotalCount(total);
        List<EditorDTO> editorDTO = editorServiceImpl.getList(cri);
        AsyncPageDTO asyncPageDTO = new AsyncPageDTO();
        asyncPageDTO.setPageDTOs(editorDTO);
        asyncPageDTO.setHasNext(1,pageDTO.getEndPage());
        return ResponseEntity.ok(asyncPageDTO);
    }
    
    @PostMapping("/editor-price") 
    public ResponseEntity<?> EditorPrice(EditorPriceListDTO editorPriceDTO) {
    	
    	editorPriceDTO.setEditorId(10);
    	editorServiceImpl.requestEditorPrice(editorPriceDTO);
    	log.info("priceDTO {} ", editorPriceDTO);
    	return ResponseEntity.ok().build();
    }
    
}
