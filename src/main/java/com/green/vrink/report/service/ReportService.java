package com.green.vrink.report.service;

import com.green.vrink.report.dto.ReportDTO;
import org.springframework.stereotype.Service;

public interface ReportService {

    Integer saveReportBoard(ReportDTO reportDTO);


    Integer checkReport(ReportDTO reportDTO);

}
