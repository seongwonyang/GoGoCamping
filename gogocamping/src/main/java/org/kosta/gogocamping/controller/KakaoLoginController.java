package org.kosta.gogocamping.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.KakaoLoginVO;
import org.kosta.gogocamping.model.domain.PagingBean;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.CustomerMapper;
import org.kosta.gogocamping.model.mapper.KakaoLoginMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KakaoLoginController {
	@Resource
	private KakaoLoginMapper kakaoLoginMapper; 
	@Resource
	private ProductMapper productMapper;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private CategoryMapper categoryMapper;
	@Resource
	private CustomerMapper customerMapper;
	
	//카카오 로그인
	@RequestMapping("callbackKaKao")
	@Transactional
	public String callackKaKao(HttpSession session, HttpServletRequest request, Model model) {
		String customerId = request.getParameter("kakaoId");
		String customerName = request.getParameter("kakaoName");
		String kakaoEmail = request.getParameter("kakaoEmail");
		
		KakaoLoginVO kvo = kakaoLoginMapper.findKakaoId(kakaoEmail);
		
		if(kvo == null) {
			System.out.println("카카오 연동정보 없음");
			kakaoLoginMapper.registerKakao(customerId, customerName, kakaoEmail);
			model.addAttribute("customerId", customerId);
			model.addAttribute("email", kakaoEmail);
			model.addAttribute("name", customerName);
			return "customer/kakao-register.tiles";
		}else {
			CustomerVO customerVO = customerMapper.findCustomerId(customerId); 
			int totalCount = productMapper.getAllProductCount();
			PagingBean pagingBean = new PagingBean(totalCount);

			int startRowNumber = pagingBean.getStartRowNumber();
			int endRowNumber = pagingBean.getEndRowNumber();

			Map<String, Object> map = new HashMap<>();
			map.put("startRowNumber", startRowNumber);
			map.put("endRowNumber", endRowNumber);
			map.put("option", "");
			
			model.addAttribute("pagingBean", pagingBean);
			model.addAttribute("allProductList", productMapper.getAllProductList(map)); // 전체 상품 리스트
			model.addAttribute("allBrandList", sellerMapper.getAllBrandList()); // 전체 브랜드 리스트
			model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트
			session.setAttribute("loginVO", customerVO);
			session.setAttribute("kakaoVO", kvo);
			return "home.tiles";
		}
	}
	//카카오 회원가입
	@RequestMapping("kakaoRegisterCustomer")
	public String naverRegisterCustomer(String customerId, String customerName, String customerEmail, String customerTel, String customerBirth, String customerPostNumber, String customerAddress, String customerDetailedAddress) {
		kakaoLoginMapper.kakaoRegisterCustomer(customerId, customerName, customerEmail, customerTel, customerBirth, customerPostNumber, customerAddress, customerDetailedAddress);
		return "customer/kakao-login.tiles";
	}
}
