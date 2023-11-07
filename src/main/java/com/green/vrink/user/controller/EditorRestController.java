package com.green.vrink.user.controller;


import com.green.vrink.upload.service.UploadService;
import com.green.vrink.user.dto.*;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.EditorService;
import com.green.vrink.user.service.EditorServiceImpl;

import com.green.vrink.user.service.UserService;
import com.green.vrink.util.AsyncPageDTO;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.Define;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/editor")
@Slf4j
@RequiredArgsConstructor
public class EditorRestController {
    private final EditorService editorService;
    private final UserRepository userRepository;
    private final HttpSession session;
    private final UploadService uploadService;
    private final UserService userService;

    @PostMapping("/apply-request")
    public ResponseEntity<?> apply(
            @RequestBody ApprovalDTO approvalDTO
            , HttpSession session
    ) {


        User user = (User) session.getAttribute(Define.USER);



        approvalDTO.setUserId(user.getUserId());


        Integer res =  editorService.requestApproval(approvalDTO);


        log.info("Test Dto {}", approvalDTO);


        return ResponseEntity.ok().build();

    }

    @Transactional
    @PostMapping("/editor-write")
    public ResponseEntity<?> editorWriteProc(EditorWriteDTO editorWriteDTO) {
        User user = (User)session.getAttribute(Define.USER);
        editorWriteDTO.setUserId(user.getUserId());
        log.info("{}", editorWriteDTO);
        editorService.requestEditorWrite(editorWriteDTO);
    	return ResponseEntity.ok().build();
    }

    @PostMapping("/editor-edit")
    public ResponseEntity<?> editorEidtProc(EditorDTO editorDTO) {
        if(editorDTO.getDelImage() != null) {

            List<String> delImages = new ArrayList<>();
            for(int i = 0; i<editorDTO.getDelImage().length; i++) {
                delImages.add(editorDTO.getDelImage()[i].replace("/","\\"));
            }

            for(int j = 0; j < delImages.size(); j++) {
                if(delImages.get(j).split("/")[delImages.get(j).split("/").length-1].equals("no_face.png")
                || delImages.get(j).split("/")[delImages.get(j).split("/").length-1].equals("default_image.gif")) {
                    delImages.remove(j);
                }
            }
            log.info("delImages {}: ", delImages);
            log.info("editorDTO{} : ", editorDTO);

            if(delImages.size() > 0) {
                uploadService.imgRemove(delImages);
            }
        }

        log.info("{}",editorDTO);
        editorService.requestEditorEdit(editorDTO);
    	return ResponseEntity.ok().build();
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
        Integer total = editorService.getTotal();
        pageDTO.setArticleTotalCount(total);
        List<EditorDTO> editorDTO = editorService.getList(cri);
        AsyncPageDTO asyncPageDTO = new AsyncPageDTO();
        asyncPageDTO.setPageDTOs(editorDTO);
        asyncPageDTO.setHasNext(1,pageDTO.getEndPage());
        return ResponseEntity.ok(asyncPageDTO);
    }

    @PostMapping("/calculate/point")
    public ResponseEntity<?> calculatePoint(@RequestBody CalculatePointDto calculatePointDto) {
        User user = userService.findByUserId(calculatePointDto.getUserId());
        int editorId = editorService.findEditorId(calculatePointDto.getUserId());
        calculatePointDto.setUserId(editorId);

        int result = editorService.calculatePoint(calculatePointDto);
        if (result != 1) {
            return ResponseEntity.badRequest().build();
        }
        int balancePoint =  user.getPoint() - calculatePointDto.getPoint();
        int saveChangePoint = editorService.updatePoint(user.getUserId(), balancePoint);

        if (saveChangePoint != 1) {
            return ResponseEntity.badRequest().build();
        }

        return ResponseEntity.ok().build();
    }
}
