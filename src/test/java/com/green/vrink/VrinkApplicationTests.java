package com.green.vrink;


import org.apache.tomcat.jni.Time;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.jupiter.api.Test;

import org.openqa.selenium.WebDriver;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Bean;


import java.io.IOException;
import java.time.LocalDate;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;


@SpringBootTest
class VrinkApplicationTests {


    @Autowired
    private MainRepository mainRepository;
    private static final String JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c";
    private static final String SK = "asdfdd";

    private WebDriver driver;
    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static String WEB_DRIVER_PATH = "C:\\PSG\\tools\\chromedriver.exe";


    @Test
    void contextLoads() {
        String upperCase = JWT.toUpperCase();
        System.out.println(upperCase);

    }


    @Test
    void jwt암호화() {


        LocalDate now = LocalDate.now();
        int add = now.getMonthValue() + now.getDayOfMonth();
        int res = add / 4;

        if (res == 0) {
            res = 4;
        }


        String[] split = JWT.split("\\.");
        String payload = SK + split[1];
        StringBuffer stringBuffer = new StringBuffer();
        String changedCaseText = "";

        System.out.println(payload);

//        chat

        for (int i = 0; i < payload.length(); i++) {
            char c1 = payload.charAt(i);

            if (c1 > 64 && c1 < 91) {
                changedCaseText += (c1 + "").toLowerCase();

            } else if (c1 > 96 && c1 < 123) {
                changedCaseText += (c1 + "").toUpperCase();

            } else {
                changedCaseText += c1 + "";
            }


        }

        System.out.println(changedCaseText);


        for (int i = 0; i < changedCaseText.length(); i++) {

            char c1 = changedCaseText.charAt(i);
            // res 결과 만큼 반복
            for (int j = 0; j <= res; j++) {


                // 숫자
                if (c1 > 47 && c1 <= 58) {

                    if (c1 == 57) {
                        c1 = 48;

                    } else {
                        c1++;

                    }

                }
                // 대문자
                if (c1 > 64 && c1 < 91) {

                    if (c1 == 90) {
                        c1 = 65;
                    } else {
                        c1++;
                    }

                }
                //소문자
                if (c1 > 96 && c1 < 123) {


                    if (c1 == 122) {

                        c1 = 97;

                    } else {

                        c1++;

                    }

                }


            }
            stringBuffer.append(c1);
        }
        System.out.println(stringBuffer.toString());

    }

    @Test
    void jwt복호화() {
        String s = "EWHJHHICnDHamMsMmBqNq4rxc7shOAmMAMFQjXdwm0mOTZEk8Kvk3PmMAMEaj4mNSBrxi6qNq9qhmCJu";
        String substring = s.substring(6);
        System.out.println(substring);
        String changedCaseText = "";
        StringBuffer stringBuffer = new StringBuffer();
        LocalDate now = LocalDate.now();
        int add = now.getMonthValue() + now.getDayOfMonth();
        int res = add / 4;

        if (res == 0) {
            res = 4;
        }

        for (int i = 0; i < substring.length(); i++) {
            char c1 = substring.charAt(i);

            if (c1 > 64 && c1 < 91) {
                changedCaseText += (c1 + "").toLowerCase();

            } else if (c1 > 96 && c1 < 123) {
                changedCaseText += (c1 + "").toUpperCase();

            } else {
                changedCaseText += c1 + "";
            }


        }
        for (int i = 0; i < changedCaseText.length(); i++) {

            char c1 = changedCaseText.charAt(i);
            // res 결과 만큼 반복
            for (int j = 0; j <= res; j++) {


                // 숫자
                if (c1 > 47 && c1 <= 58) {

                    if (c1 == 48) {
                        c1 = 57;

                    } else {
                        c1--;

                    }

                }
                // 대문자
                if (c1 > 64 && c1 < 91) {

                    if (c1 == 65) {
                        c1 = 90;
                    } else {
                        c1--;
                    }

                }
                //소문자
                if (c1 > 96 && c1 < 123) {


                    if (c1 == 97) {

                        c1 = 122;

                    } else {

                        c1--;

                    }

                }


            }
            stringBuffer.append(c1);
        }
        System.out.println(stringBuffer.toString());
        String a = "eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ";
        String b = stringBuffer.toString();

        if (a.equals(b)) {
            System.out.println("같음");
        }
    }

    @Test
    public void asdf() {

    }

    @Test
    public void daily() {
        String dailyUrl = "https://playboard.co/youtube-ranking/most-popular-v-tuber-channels-in-south-korea-monthly";
        Map<String, List<String>> daily = crawling(dailyUrl);
        RankDTO rank = new RankDTO();
        rank.setDivision("monthly");
        for (int i = 0; i < 10; i++) {
            rank.setChannel(daily.get("channel").get(i));
            rank.setThumbnail(daily.get("thumbnail").get(i));
            rank.setSubscribe(daily.get("subscribe").get(i));
            rank.setLink("https://www.youtube.com/results?search_query=" + daily.get("channel").get(i));
            mainRepository.insertDailyRank(rank);
        }
    }

    @Test
    public void virtube() {
        String dailyUrl = "https://playboard.co/youtube-ranking/most-popular-v-tuber-channels-in-south-korea-daily";
//        String weeklyUrl = "https://playboard.co/youtube-ranking/most-popular-v-tuber-channels-in-south-korea-weekly";
//        String monthlyUrl = "https://playboard.co/youtube-ranking/most-popular-v-tuber-channels-in-south-korea-monthly";

        Map<String, List<String>> daily = crawling(dailyUrl);
//        Map<String, List<String>> weekly = crawling(weeklyUrl);
//        Map<String, List<String>> monthly = crawling(monthlyUrl);

        for(int i = 0; i < 14; i++) {
            System.out.println(daily.get("채널명").get(i));
            System.out.println(daily.get("구독자").get(i));
            System.out.println(daily.get("썸네일").get(i));
        }

    }
    @Test
    public Map<String, List<String>> crawling(String url){
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
