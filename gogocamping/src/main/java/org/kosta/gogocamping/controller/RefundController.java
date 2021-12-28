package org.kosta.gogocamping.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.RefundVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.CustomerMapper;
import org.kosta.gogocamping.model.mapper.OrderMapper;
import org.kosta.gogocamping.model.mapper.RefundMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
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
	
	@RequestMapping("refund")
	public String refund(HttpServletRequest request, int orderDetailNo, Model model) {
		HttpSession session = request.getSession(false);
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginVO");
		
		model.addAttribute("refundProduct", orderMapper.getProductInfoByOrderDetailNo(orderDetailNo));
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList());
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트
		
		return "customer/refund.tiles";
	}
	
	@RequestMapping("insertRefund")
	public String insertRefund(HttpServletRequest request, RefundVO refundVO, int orderDetailNo, Model model) {
		HttpSession session = request.getSession(false);
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginVO");
		
		System.out.println(refundVO);
		
		OrderDetailVO orderDetailVO = new OrderDetailVO();
		orderDetailVO.setOrderDetailNo(orderDetailNo);
		
		refundVO.setOrderDetailVO(orderDetailVO);
		refundMapper.insertRefund(refundVO); // 환불 테이블 삽입
		orderMapper.updateStatusOrderDetail(orderDetailNo);
		
		List<OrderDetailVO> list = customerMapper.orderCheck(customerVO.getCustomerId());
		model.addAttribute("orderList", list);
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList()); // 전체 브랜드 리스트
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트
		return "customer/customer-orderCheck.tiles";
	}
	
}
