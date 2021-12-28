package org.kosta.gogocamping.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.ProductVO;
import org.kosta.gogocamping.model.domain.ReviewVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.ReviewMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	@Resource
	private ReviewMapper reviewMapper;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private CategoryMapper categoryMapper;
	
	@RequestMapping("writeReviewPage")
	public String writeReviewPage(int productId, Model model) {
		model.addAttribute("productId", productId);
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList()); // 전체 브랜드 리스트
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트
		return "customer/review-write.tiles";
	}
	
	@RequestMapping("writeReview")
	public String writeReview(HttpServletRequest request, ReviewVO reviewVO, int productId) {
		HttpSession session = request.getSession(false);
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginVO");
		reviewVO.setCustomerVO(customerVO);
		
		System.out.println(customerVO);
		
		ProductVO productVO = new ProductVO();
		productVO.setProductId(productId);
		reviewVO.setProductVO(productVO);
		
		System.out.println(reviewVO);
		
		reviewMapper.writeReview(reviewVO);
		
		return "redirect:getProductDetailInfo?productId="+productId+"&sortOption=";
	}
}
