package com.green.vrink.report.repository.interfaces;

import com.green.vrink.report.repository.model.Report;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportRepository {

    public Integer saveReport(Report report);



}
