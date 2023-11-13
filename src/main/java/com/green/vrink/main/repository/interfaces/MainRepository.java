package com.green.vrink.main.repository.interfaces;

import com.green.vrink.main.RankDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainRepository {
    Integer insertDailyRank(RankDTO rank);

    List<RankDTO> findDailyRank();

    List<RankDTO> findWeeklyRank();

    List<RankDTO> findMonthlyRank();

    void deleteDailyRank();

    void deleteWeeklyRank();

    void deleteMonthlyRank();
}
