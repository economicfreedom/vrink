package com.green.vrink.util;

import lombok.Data;

import java.util.List;

@Data
public class AsyncPageDTO {
    private List<?> pageDTOs;
    private boolean hasNext;

    public void setHasNext(int nowPage, int endPage) {
        if (nowPage == endPage) {
            hasNext = false;
            return;
        }
        hasNext = true;
    }
}
