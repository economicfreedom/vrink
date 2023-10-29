package com.green.vrink.community.controller;


import com.green.vrink.community.dto.FreeBoardReplyDTO;
import com.green.vrink.util.AsyncPageDTO;
import com.green.vrink.community.service.FreeBoardReplyService;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/free-reply")
@RequiredArgsConstructor
@Slf4j
public class FreeBoardReplyRestController {
    private final FreeBoardReplyService freeBoardReplyService;

    @PostMapping("/add")
    public ResponseEntity<?> write(
            @RequestBody
            FreeBoardReplyDTO freeBoardReplyDTO
            , HttpSession httpSession

    ) {
        freeBoardReplyDTO.setUserId(60);
        freeBoardReplyService.create(freeBoardReplyDTO);

        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/del/{commu-id}")
    public ResponseEntity<?> del(
            @PathVariable(name = "commu-id")
            Integer commuId
    ) {
        if (commuId == null){
            return ResponseEntity.badRequest().build();
        }
        freeBoardReplyService.delete(commuId);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/update")
    public ResponseEntity<?> update(
            @RequestBody
            FreeBoardReplyDTO freeBoardReplyDTO
            , HttpSession httpSession
    ) {
        freeBoardReplyDTO.setUserId(1);

        freeBoardReplyService.update(freeBoardReplyDTO);

        return ResponseEntity.ok().build();
    }

    @GetMapping("/more-reply")
    public ResponseEntity<?> more(@RequestParam(name = "commu-id")
                                  Integer commuId
                                , @RequestParam(name = "page-num")
                                  Integer pageNum
                                , @RequestParam
                                  Integer total
    ){
        log.info("동작함 ");
        Criteria cri = new Criteria();
        cri.setPageNum(pageNum);
        cri.setCountPerPage(7);
        List<FreeBoardReplyDTO> freeBoardReplyDTOS = freeBoardReplyService.readList(commuId, cri);

        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(total);
        AsyncPageDTO asyncPageDTO = new AsyncPageDTO();
        asyncPageDTO.setHasNext(pageNum,pageDTO.getEndPage());
        asyncPageDTO.setPageDTOs(freeBoardReplyDTOS);

        return ResponseEntity.ok().body(asyncPageDTO);
    }
}
