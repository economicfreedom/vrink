package com.green.vrink.user.controller;


import com.green.vrink.user.dto.*;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.EditorServiceImpl;

import com.green.vrink.util.AsyncPageDTO;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.Define;
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
    private final UserRepository userRepository;
    private final HttpSession session;
    @PostMapping("/apply-request")
    public ResponseEntity<?> apply(
            @RequestBody ApprovalDTO approvalDTO
            , HttpSession session
    ) {


        User user = (User) session.getAttribute(Define.USER);



        approvalDTO.setUserId(user.getUserId());


        Integer res =  editorServiceImpl.requestApproval(approvalDTO);


        log.info("Test Dto {}", approvalDTO);


        return ResponseEntity.ok().build();

    }
    
    @PostMapping("/editor-write")
    public Integer editorWriteProc(EditorWriteDTO editorWriteDTO) {

        User user = (User)session.getAttribute(Define.USER);
        editorWriteDTO.setUserId(user.getUserId());
        log.info("{}", editorWriteDTO);
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
        User user = (User)session.getAttribute(Define.USER);
        int editorId = userRepository.findEditorIdByUserId(user.getUserId());
        editorPriceDTO.setEditorId(editorId);
    	editorServiceImpl.requestEditorPrice(editorPriceDTO);
    	log.info("priceDTO {} ", editorPriceDTO);
    	return ResponseEntity.ok().build();
    }

    @PostMapping("/calculate/point")
    public ResponseEntity<?> calculatePoint(@RequestBody CalculatePointDto calculatePointDto) {
        User user = userRepository.findByUserId(calculatePointDto.getUserId());
        System.out.println("userId: " + user.getUserId());
        int editorId = editorServiceImpl.findEditorId(calculatePointDto.getUserId());
        System.out.println("editId: " + editorId);
        calculatePointDto.setUserId(editorId);

        int result = editorServiceImpl.calculatePoint(calculatePointDto);
        System.out.println("result: " + 0);
        if (result != 1) {
            return ResponseEntity.badRequest().build();
        }
        int balancePoint =  user.getPoint() - calculatePointDto.getPoint();
        System.out.println("balancePoint: " + balancePoint);
        int saveChangePoint = editorServiceImpl.updatePoint(user.getUserId(), balancePoint);
        System.out.println("saveChangePoint: " + saveChangePoint);

        if (saveChangePoint != 1) {
            return ResponseEntity.badRequest().build();
        }

        return ResponseEntity.ok().build();
    }
    
}
