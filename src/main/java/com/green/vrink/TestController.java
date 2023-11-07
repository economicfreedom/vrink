package com.green.vrink;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class TestController {

    @GetMapping("/request-list")
    public String editorRequestList(){

        return "requestList";
    }

    @GetMapping("/request-view")
    public String requestView(){



        return "requestView";

    }


}
