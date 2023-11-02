package com.green.vrink;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.util.Date;

@SpringBootTest
class VrinkApplicationTests {


    private static final String JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c";
    private static final String SK = "asdfdd";


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
        
        if (a.equals(b)){
            System.out.println("같음");
        }
    }
}
