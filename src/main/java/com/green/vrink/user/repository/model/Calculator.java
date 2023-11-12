package com.green.vrink.user.repository.model;

import lombok.Data;

@Data
public class Calculator {
    private Integer calId;
    private Integer editorId;
    private Integer calPrice;
    private Integer realCalPrice;
    private Integer calStatus;
    private String createdAt;
    private String completeDate;
}
