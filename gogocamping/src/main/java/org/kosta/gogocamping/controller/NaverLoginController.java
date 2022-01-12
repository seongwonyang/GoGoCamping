package org.kosta.gogocamping.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.NaverLoginVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.CustomerMapper;
import org.kosta.gogocamping.model.mapper.NaverLoginMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NaverLoginController {
	@Resource
	private NaverLoginMapper naverLoginMapper;
	@Resource
	private ProductMapper productMapper;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private CategoryMapper categoryMapper;
	@Resource
	private CustomerMapper customerMapper;
	
	//네이버 로그인
	@RequestMapping("/callback")
	@Transactional
	public String naverCallback(HttpSession session, HttpServletRequest request, Model model)
			throws IOException, ParseException {

		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:7777/callback", "UTF-8");

		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + "sKPixzJ1zQsrjGzTzog0";
		apiURL += "&client_secret=" + "okWmSDpZfu";
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;

		String res = requestToServer(apiURL);
		if (res != null && !res.equals("")) {
			
			model.addAttribute("res", res);
			Map<String, Object> parsedJson = new JSONParser(res).parseObject();
			if(parsedJson.get("access_token") != null) {
				String infoStr = getProfileFromNaver(parsedJson.get("access_token").toString());
				Map<String, Object> infoMap = new JSONParser(infoStr).parseObject();
				if(infoMap.get("message").equals("success")) {
					Map<String, Object> infoResp = (Map<String, Object>) infoMap.get("response");
					String customerId = infoResp.get("id").toString();
					String naverEmail = infoResp.get("email").toString();
					String phone = infoResp.get("mobile").toString();
					String customerName = infoResp.get("name").toString();
					
					NaverLoginVO nvo = naverLoginMapper.findNaverId(naverEmail);
					
					if(nvo == null) {
						System.out.println("네이버 연동정보 없음");
						naverLoginMapper.registerNaver(customerId, customerName, naverEmail);
						model.addAttribute("isConnectedToNaver", false);
						model.addAttribute("naverId", customerId);
						model.addAttribute("email", naverEmail);
						model.addAttribute("phone", phone);
						model.addAttribute("name", customerName);
						return "customer/naver-register.tiles";
					}else {
						CustomerVO customerVO = customerMapper.findCustomerId(customerId); 
						model.addAttribute("isConnectedToNaver", true);
						session.setAttribute("loginVO", customerVO);
						session.setAttribute("naverVO", nvo);
						return "redirect:/";
					}
				}
			}
			session.setAttribute("currentUser", res);
			model.addAttribute("currentAT", parsedJson.get("access_token"));
			model.addAttribute("currentRT", parsedJson.get("refresh_token"));
			return "home.tiles";
			
		} else {
			model.addAttribute("res", "Login failed!");
			return "home.tiles";
		}
	}
	//네이버 로그인 끝 지점
	private String requestToServer(String apiURL) throws IOException {
		return requestToServer(apiURL, "");
	}
	private String requestToServer(String apiURL, String headerStr) throws IOException {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");

		if (headerStr != null && !headerStr.equals("")) {
			con.setRequestProperty("Authorization", headerStr);
		}

		int responseCode = con.getResponseCode();
		BufferedReader br;

		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		if (responseCode == 200) {
			return res.toString();
		} else {
			return null;
		}
	}
	//네이버 토큰으로 정보 받아오기
	@RequestMapping("/naver/getProfile")
	public String getProfileFromNaver(String accessToken) throws IOException {
		// 네이버 로그인 접근 토큰;
		String apiURL = "https://openapi.naver.com/v1/nid/me";
		String headerStr = "Bearer " + accessToken; // Bearer 다음에 공백 추가
		String res = requestToServer(apiURL, headerStr);
		
		return res;
	}
	//네이버 회원가입
	@RequestMapping("/naverRegisterCustomer")
	public String naverRegisterCustomer(String customerId, String customerName, String customerEmail, String customerTel, String customerBirth, String customerPostNumber, String customerAddress, String customerDetailedAddress) {
		naverLoginMapper.naverRegisterCustomer(customerId, customerName, customerEmail, customerTel, customerBirth, customerPostNumber, customerAddress, customerDetailedAddress);
		return "customer/naver-login.tiles";
	}
}
