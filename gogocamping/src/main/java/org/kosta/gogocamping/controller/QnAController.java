package org.kosta.gogocamping.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.ProductVO;
import org.kosta.gogocamping.model.domain.QnAVO;
import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.QnAMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/QnA")
public class QnAController {
	@Resource
	private QnAMapper qnaMapper;
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
	public String writeQuestionPage(String productId, Model model) {
		model.addAttribute("productId", productId);

		return "customer/qna-write.tiles";
	}
	
	@RequestMapping("/write")
	public String writeQuestion(HttpServletRequest request, QnAVO qnaVO, int productId, String qnaCategory, Model model) {
		HttpSession session = request.getSession(false);
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginVO");
		qnaVO.setCustomerVO(customerVO);
		
		ProductVO productVO = new ProductVO();
		productVO.setProductId(productId);
		qnaVO.setProductVO(productVO);
		
		qnaMapper.writeQuestion(qnaVO);
		
		return "redirect:/product/getProductDetailInfo?productId="+productId+"&sortOption=";
	}
}
