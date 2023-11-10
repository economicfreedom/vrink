package com.green.vrink.main.service;

import com.green.vrink.main.RankDTO;

import java.util.List;
import java.util.Map;

public interface MainService {
    void daily();
    void weekly();
    void monthly();
    Map<String, List<String>> crawling(String url);

    List<RankDTO> getDaily();

    List<RankDTO> getWeekly();

    List<RankDTO> getMonthly();
}
