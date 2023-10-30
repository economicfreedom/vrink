package com.green.vrink.user.controller;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.vrink.user.dto.KakaoSignInDto;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.UserService;
import com.green.vrink.util.Define;

@Controller
@RequestMapping("/kakao")
public class KakaoController {
	// https://kauth.kakao.com/oauth/authorize?client_id=3054fe89635c5de07719fe9908728827&redirect_uri=http://localhost/kakao/sign-in&response_type=code
	// https://kauth.kakao.com/oauth/authorize?client_id=3054fe89635c5de07719fe9908728827
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;
	
	@GetMapping("/sign-in")
	public String getKakaoUserInfo(String code, Model model) throws ParseException {
	    System.out.println("OAuth Code : "+code);
	    //////////////////////Token 정보 요청//////////////////////
	    try {
	        URL url = new URL("https://kauth.kakao.com/oauth/token");
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);

	        StringBuilder sb = new StringBuilder();
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=" + "3054fe89635c5de07719fe9908728827");
	        sb.append("&code=" + code);
	        BufferedWriter bw = null;
	        try{
	            bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            bw.write(sb.toString());
	        }catch(IOException e){
	            throw e;
	        }finally{
	            if(bw != null) bw.flush();
	        }
	        BufferedReader br = null;
	        String line = "", result = "";
	        try {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	        } catch (IOException e) {
	            throw e;
	        } finally {
	            if (br != null)
	                br.close();
	        }
	        System.out.println("result : " + result);
	        
	        ObjectMapper mapper = new ObjectMapper();
	        String access_token = mapper.readValue(result, KakaoSignInDto.class).getAccess_token();
	        
	        url = new URL("https://kapi.kakao.com/v2/user/me");
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);
	        conn.setRequestProperty("Authorization", "Bearer "+access_token);
	        System.out.println(conn.getURL());

	        line = ""; result = "";
	        try {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	        } catch (IOException e) {
	            throw e;
	        } finally {
	            if (br != null)
	                br.close();
	        }
	        System.out.println("result user : " + result);
	        
	        JSONParser jsonParser = new JSONParser();
	        Object object = jsonParser.parse(result);
	        JSONObject jsonObject = (JSONObject)object;
	        
	        object = jsonParser.parse(jsonObject.get("kakao_account").toString());
	        jsonObject = (JSONObject)object;
	        
	        String email = jsonObject.get("email").toString();
	        
	        if (userRepository.checkEmail(email) == null) {
	        	object = jsonParser.parse(jsonObject.get("profile").toString());
	        	jsonObject = (JSONObject)object;
	        	
	        	String nickname = jsonObject.get("nickname").toString();
	        	String profileImage = jsonObject.get("profile_image_url").toString();
	        	
	        	System.out.println(email);
	        	System.out.println(nickname);
	        	System.out.println(profileImage);
	        	
	        	model.addAttribute("email", email);
	        	model.addAttribute("profileImage", profileImage);
	        	model.addAttribute("nickname", nickname);

	        	return "/user/kakaoSignup";
			}
	        
	        User user = userService.signIn(email);
	        session.setAttribute(Define.USER, user);
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return "/user/applyForm";
	    //////////////////////Token 정보 요청 끝//////////////////////
	}
}
