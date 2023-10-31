package com.green.vrink.report.dto;


import lombok.Builder;
import lombok.Data;

import javax.validation.Valid;
import javax.validation.constraints.Min;

@Data
@Builder
public class ReportDTO {
    private Integer reportId;
    @Min(value = 0,message = "신고한 유저의 번호는 필수입니다")
    private Integer reportUserId;
    @Min(value = 0,message = "신고당한 유저의 번호는 필수입니다")
    private Integer userId;
    private Integer boardId;
    private Integer editorId;
    private String createdAt;


}
