package org.kosta.gogocamping.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.RefundVO;
import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.CustomerMapper;
import org.kosta.gogocamping.model.mapper.OrderMapper;
import org.kosta.gogocamping.model.mapper.RefundMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/refund")
public class RefundController{
	@Resource
	private RefundMapper refundMapper;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private CategoryMapper categoryMapper;
	@Resource
	private OrderMapper orderMapper;
	@Resource
	private CustomerMapper customerMapper;
	
	@ModelAttribute("allBrandList")
	public List<SellerVO> allBrandList() {
		return sellerMapper.getAllBrandList(); // 전체 브랜드 리스트
	}
	@ModelAttribute("categoryList")
	public List<CategoryVO> categoryList() {
		return categoryMapper.getCategoryList(); // 전체 카테고리 리스트
	}
	
	@RequestMapping("/writePage")
	public String refund(int orderDetailNo, Model model) {
		model.addAttribute("refundProduct", orderMapper.getProductInfoByOrderDetailNo(orderDetailNo));
		
		return "customer/refund.tiles";
	}
	
	@Transactional
	@RequestMapping("/write")
	public String insertRefund(HttpServletRequest request, RefundVO refundVO, int orderDetailNo, Model model) {
		HttpSession session = request.getSession(false);
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginVO");

		OrderDetailVO orderDetailVO = new OrderDetailVO();
		orderDetailVO.setOrderDetailNo(orderDetailNo);
		
		refundVO.setOrderDetailVO(orderDetailVO);
		
		System.out.println("refundVO: " + refundVO);
		
		refundMapper.insertRefund(refundVO); // 환불 테이블 삽입
		orderMapper.updateStatusOrderDetail(orderDetailNo);

		return "redirect:/order/orderCheck?customerId="+customerVO.getCustomerId();
	}
	
}
