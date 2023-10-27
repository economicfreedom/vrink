package com.green.vrink.community.controller;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.service.FreeBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/board")
@RequiredArgsConstructor
@RestController
@Slf4j
public class FreeBoardRestController {

    private final FreeBoardService freeBoardService;

    @PostMapping("/write")
    public ResponseEntity<?> write(@RequestBody FreeBoardDTO freeBoardDTO) {

        freeBoardService.create(freeBoardDTO);
        log.info("freeBobard dto {}", freeBoardDTO);


        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/del/{community-id}")
    public ResponseEntity<?> delete(
            @PathVariable("community-id")
            Integer communityId
    ) {

        freeBoardService.delete(communityId);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/update")
    public ResponseEntity<?> update(
            @RequestBody FreeBoardDTO freeBoardDTO){
        log.info("update freeBoardDTO",freeBoardDTO);
        freeBoardService.update(freeBoardDTO);

        return null;
    }

}
