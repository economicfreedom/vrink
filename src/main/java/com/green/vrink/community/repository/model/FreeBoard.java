package com.green.vrink.community.repository.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class FreeBoard {


    private Integer communityId;
    private Integer userId;
    private String title;
    private String content;
    private String createdAt;


}
