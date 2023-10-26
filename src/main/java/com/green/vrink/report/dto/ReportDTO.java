package com.green.vrink.report.dto;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ReportDTO {
    private Integer reportId;
    private Integer reportUserId;
    private Integer userId;
    private Integer boardId;
    private Integer editorId;
    private String createdAt;


}
