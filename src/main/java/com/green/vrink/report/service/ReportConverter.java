package com.green.vrink.report.service;

import com.green.vrink.report.dto.ReportDTO;
import com.green.vrink.report.repository.model.Report;
import com.green.vrink.util.Converter;

public class ReportConverter implements Converter<ReportDTO, Report> {


    @Override
    public ReportDTO toDTO(Report report) {
        return ReportDTO.builder()
                .boardId(report.getBoardId())
                .reportUserId(report.getReportUserId())
                .editorId(report.getEditorId())
                .createdAt(report.getCreatedAt())
                .userId(report.getUserId())
                .reportId(report.getReportId())
                .build();
    }

    @Override
    public Report toEntity(ReportDTO reportDTO) {
        return Report.builder()
                .boardId(reportDTO.getBoardId())
                .userId(reportDTO.getUserId())
                .reportId(reportDTO.getReportId())
                .reportUserId(reportDTO.getReportUserId())
                .editorId(reportDTO.getEditorId())
                .createdAt(reportDTO.getCreatedAt())
                .build();
    }
}
