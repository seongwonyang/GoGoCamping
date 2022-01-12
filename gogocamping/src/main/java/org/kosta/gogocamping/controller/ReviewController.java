package org.kosta.gogocamping.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.ProductVO;
import org.kosta.gogocamping.model.domain.ReviewVO;
import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.ReviewMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Resource
	private ReviewMapper reviewMapper;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private CategoryMapper categoryMapper;
	
	@ModelAttribute("allBrandList")
	public List<SellerVO> allBrandList() {
		return sellerMapper.getAllBrandList(); // 전체 브랜드 리스트
	}
	@ModelAttribute("categoryList")
	public List<CategoryVO> categoryList() {
		return categoryMapper.getCategoryList(); // 전체 카테고리 리스트
	}
	
	@RequestMapping("/writePage")
	public String writeReviewPage(int productId, Model model) {
		model.addAttribute("productId", productId);

		return "customer/review-write.tiles";
	}
	
	@RequestMapping("/write")
	public String writeReview(HttpServletRequest request, ReviewVO reviewVO, int productId) {
		HttpSession session = request.getSession(false);
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginVO");
		reviewVO.setCustomerVO(customerVO);
		
		ProductVO productVO = new ProductVO();
		productVO.setProductId(productId);
		reviewVO.setProductVO(productVO);

		reviewMapper.writeReview(reviewVO);
		
		return "redirect:/product/getProductDetailInfo?productId="+productId+"&sortOption=";
	}
}
