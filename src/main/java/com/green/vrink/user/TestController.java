package com.green.vrink.user;

import com.green.vrink.user.dto.ApprovalDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class TestController {

    @GetMapping("/test")
    public String test(){



        return "test";
    }
    @PostMapping("/test2")
    @ResponseBody
    public ResponseEntity<?> test2(@RequestBody ApprovalDTO approvalDTO){

        log.info("Test Dto {}", approvalDTO);


        return ResponseEntity.ok().build();
    }


}
