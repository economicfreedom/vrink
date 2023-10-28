package com.green.vrink.community.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
public class ReplyPageDTO {
    private List<FreeBoardReplyDTO> freeBoardReplyDTOS;
    private boolean hasNext;

    public void setHasNext(Integer nowPage, Integer endPage) {
        if (nowPage == endPage) {
            hasNext = false;
            return;
        }
        hasNext = true;
    }
}
