package com.green.vrink.report.service;

import com.green.vrink.report.dto.ReportDTO;
import com.green.vrink.report.repository.interfaces.ReportRepository;
import com.green.vrink.report.repository.model.Report;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Slf4j
@Service

public class ReportServiceImpl implements ReportService{

    private final ReportRepository reportRepository;
    private final ReportConverter reportConverter;
    @Override
    @Transactional
    public Integer saveReportBoard(ReportDTO reportDTO) {


        Report entity = reportConverter.toEntity(reportDTO);

        return reportRepository.saveReport(entity);

    }

    @Override
    @Transactional
    public Integer checkReport(ReportDTO reportDTO) {
        Report entity = reportConverter.toEntity(reportDTO);


        return reportRepository.checkReport(reportDTO);
    }
}
