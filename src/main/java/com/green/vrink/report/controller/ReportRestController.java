package com.green.vrink.report.controller;

import com.green.vrink.report.dto.ReportDTO;
import com.green.vrink.report.service.ReportService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/report")
@RequiredArgsConstructor
@Slf4j
public class ReportRestController {


    private final ReportService reportService;


    @PostMapping("/report-board")
    public ResponseEntity<?> reportBoard(@RequestBody ReportDTO reportDTO) {

        Integer res = reportService.saveReportBoard(reportDTO);
        if (res == 1){
            return ResponseEntity.ok().build();
        }else {
            return ResponseEntity.badRequest().build();
        }


    }



}
