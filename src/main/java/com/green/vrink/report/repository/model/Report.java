package com.green.vrink.report.repository.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Report {
    private Integer reportId;
    private Integer reportUserId;
    private Integer userId;
    private Integer boardId;
    private Integer editorId;
    private String createdAt;

}
