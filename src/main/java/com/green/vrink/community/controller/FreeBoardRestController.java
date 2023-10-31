package com.green.vrink.community.controller;

import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.community.service.FreeBoardService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.LoginCheck;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RequestMapping("/board")
@RequiredArgsConstructor
@RestController
@Slf4j
public class FreeBoardRestController {

    private final FreeBoardService freeBoardService;
    private final HttpSession httpSession;

    @PostMapping("/write")
    @LoginCheck
    public ResponseEntity<?> write(@RequestBody FreeBoardDTO freeBoardDTO) {

        User user = (User) httpSession.getAttribute("USER");

        if (freeBoardDTO.getUserId() == null) {
            return ResponseEntity.badRequest().build();
        }




        freeBoardService.create(freeBoardDTO);
        log.info("freeBobard dto {}", freeBoardDTO);


        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/del/{community-id}")
    @LoginCheck
    public ResponseEntity<?> delete(
            @PathVariable("community-id")
            Integer communityId
    ) {
        Integer userId = freeBoardService.getUserId(communityId);
        User user = (User) httpSession.getAttribute("USER");
        Integer sessionUserId = user.getUserId();
        if (userId != sessionUserId){
            return ResponseEntity.badRequest().build();
        }
        freeBoardService.delete(communityId);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/update")
    @LoginCheck
    public ResponseEntity<?> update(
            @RequestBody FreeBoardDTO freeBoardDTO) {

        Integer userId = freeBoardDTO.getUserId();
        User user = (User) httpSession.getAttribute("USER");
        Integer commUserId = freeBoardService.getUserId(freeBoardDTO.getCommunityId());
        Integer sessionUserId = user.getUserId();

        if (userId != commUserId || sessionUserId != commUserId ){
            return ResponseEntity.badRequest().build();
        }


        log.info("update freeBoardDTO", freeBoardDTO);
        freeBoardService.update(freeBoardDTO);

        return ResponseEntity.ok().build();
    }

}
