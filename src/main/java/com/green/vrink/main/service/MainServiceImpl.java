package com.green.vrink.main.service;

import com.green.vrink.main.RankDTO;
import com.green.vrink.main.repository.interfaces.MainRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class MainServiceImpl implements MainService{

    private final MainRepository mainRepository;

    @Override
    @Transactional
    @Scheduled(cron = "0 0 0 * * *")
    public void daily() {
        String dailyUrl = "https://playboard.co/youtube-ranking/most-popular-v-tuber-channels-in-south-korea-daily";
        Map<String, List<String>> daily = crawling(dailyUrl);
        mainRepository.deleteDailyRank();
        RankDTO rank = new RankDTO();
        rank.setDivision("daily");
        for(int i = 0; i < 10; i++) {
            rank.setChannel(daily.get("channel").get(i));
            rank.setThumbnail(daily.get("thumbnail").get(i));
            rank.setSubscribe(daily.get("subscribe").get(i));
            rank.setLink("https://www.youtube.com/results?search_query="+daily.get("channel").get(i));
            mainRepository.insertDailyRank(rank);
        }
    }

    @Override
    @Transactional
    @Scheduled(cron = "0 0 0 1 * *")
    public void weekly() {
        String weeklyUrl = "https://playboard.co/youtube-ranking/most-popular-v-tuber-channels-in-south-korea-weekly";
        Map<String, List<String>> weekly = crawling(weeklyUrl);
        mainRepository.deleteWeeklyRank();
        RankDTO rank = new RankDTO();
        rank.setDivision("weekly");
        for(int i = 0; i < 10; i++) {
            rank.setChannel(weekly.get("channel").get(i));
            rank.setThumbnail(weekly.get("thumbnail").get(i));
            rank.setSubscribe(weekly.get("subscribe").get(i));
            rank.setLink("https://www.youtube.com/results?search_query="+weekly.get("channel").get(i));
            mainRepository.insertDailyRank(rank);
        }
    }

    @Override
    @Transactional
    @Scheduled(cron = "0 0 0 * * 1")
    public void monthly() {
        String monthlyUrl = "https://playboard.co/youtube-ranking/most-popular-v-tuber-channels-in-south-korea-monthly";
        Map<String, List<String>> monthly = crawling(monthlyUrl);
        mainRepository.deleteMonthlyRank();
        RankDTO rank = new RankDTO();
        rank.setDivision("monthly");
        for(int i = 0; i < 10; i++) {
            rank.setChannel(monthly.get("channel").get(i));
            rank.setThumbnail(monthly.get("thumbnail").get(i));
            rank.setSubscribe(monthly.get("subscribe").get(i));
            rank.setLink("https://www.youtube.com/results?search_query="+monthly.get("channel").get(i));
            mainRepository.insertDailyRank(rank);
        }
    }

    @Override
    public List<RankDTO> getDaily() {

        return mainRepository.findDailyRank();
    }

    @Override
    public List<RankDTO> getWeekly() {
        return mainRepository.findWeeklyRank();
    }

    @Override
    public List<RankDTO> getMonthly() {
        return mainRepository.findMonthlyRank();
    }

    @Override
    public Map<String, List<String>> crawling(String url) {
        List<String> imageList = new ArrayList<>();
        List<String> channelList = new ArrayList<>();
        List<String> subList = new ArrayList<>();
        Map<String, List<String>> listMap = new HashMap<>();
        Document doc = null;
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Elements channels = doc.select(".name__label");
        Elements images = doc.select(".profile-image > picture > img");

        for(Element channel : channels) {
            channelList.add(channel.text());

            try {
                doc = Jsoup.connect("https://playboard.co/search?q="+channel.text()).get();
            } catch (IOException e) {
                e.printStackTrace();
            }

            Element subscribe = doc.select(".simple-scores > li").first();
            subList.add(subscribe.text().replace(" 구독,",""));
        }

        for(Element image : images) {
            imageList.add(image.attr("data-src"));
        }

        listMap.put("subscribe", subList);
        listMap.put("thumbnail", imageList);
        listMap.put("channel", channelList);

        return listMap;
    }
}
