package com.green.vrink.report.controller;

import com.green.vrink.report.dto.ReportDTO;
import com.green.vrink.report.service.ReportService;
import com.green.vrink.util.LoginCheck;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RequestMapping("/report")
@RestController
@RequiredArgsConstructor
@Slf4j
public class ReportRestController {


    private final ReportService reportService;
    private final HttpSession httpSession;

    @PostMapping("/report-board")
    @LoginCheck
    public ResponseEntity<?> reportBoard(@RequestBody ReportDTO reportDTO) {
        log.info("report dto {}",reportDTO);

//        httpSession.getAttribute()
//        if ()


        Integer checkRes = reportService.checkReport(reportDTO);

        if (checkRes != null){
            return ResponseEntity.badRequest().build();
        }

        Integer res = reportService.saveReportBoard(reportDTO);
        if (res == 1){
            return ResponseEntity.ok().build();
        }else {
            return ResponseEntity.badRequest().build();
        }


    }



}
