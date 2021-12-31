package org.kosta.gogocamping.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.ManagerVO;
import org.kosta.gogocamping.model.domain.ReviewVO;
import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.ManagerMapper;
import org.kosta.gogocamping.model.mapper.ReviewMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.kosta.gogocamping.model.service.ManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ManagerController {
	@Resource
	private ManagerMapper managerMapper;
	@Resource
	private ManagerService managerService;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private ReviewMapper reviewMapper;
	
	@RequestMapping("ManagerHome")
	public String managerHome(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginVO") == null) {
			return "manager/views/manager-login-form.tiles";
		}else {
			return "managerHome.tiles";
		}
	}
	
	@RequestMapping("managerLoginForm")
	public String managerLoginForm() {		
		return "manager/views/manager-login-form.tiles";
	}
	
	@RequestMapping("managerLogin")
	@ResponseBody
	public String managerLogin(String managerId, String managerPassword, HttpServletRequest request) {
		ManagerVO managerVO = new ManagerVO(managerId, null, managerPassword);
		
		ManagerVO loginVO = managerMapper.managerLogin(managerVO);
		
		if(loginVO!=null) {
			HttpSession session = request.getSession(false);
			session.setAttribute("loginVO", loginVO);
			session.setAttribute("loginAuth", "manger custormerseller");

			return "로그인성공";
		}else {
			return "아이디 또는 비밀번호를 확인하세요.";
		}
	}
	
	@RequestMapping("managerLogout")
	public String managerLogout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		return "manager/views/manager-login-form.tiles";
	}
	
	@RequestMapping("registerAdmin")
	public String RegisterAdmin(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session.getAttribute("loginVO") == null) {
			return "manager/views/manager-login-form.tiles";
		}
		
		ArrayList<SellerVO> sellerList = managerService.getSellerNotAdmin();
		ArrayList<SellerVO> adminSellerList = managerService.getSellerAdmin();
		
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("adminSellerList", adminSellerList);
		
		return "manager/views/register-admin.tiles";
	}
	
	@RequestMapping("adminSeller")
	public String adminSeller(String sellerId, Model model) {
		sellerMapper.adminSeller(sellerId);
		
		ArrayList<SellerVO> sellerList = managerService.getSellerNotAdmin();
		ArrayList<SellerVO> adminSellerList = managerService.getSellerAdmin();
		
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("adminSellerList", adminSellerList);
		
		return "manager/views/register-admin.tiles";
	}
	
	// 브랜드별 후기 리스트 출력
	@RequestMapping("reviewManagement")
	public String reviewManagement(Model model, HttpServletRequest request, String sellerId) {
		HttpSession session = request.getSession();
		System.out.println(sellerId);
		if(session.getAttribute("loginVO") == null) {
			return "manager/views/manager-login-form.tiles";
		}else {
			// 브랜드 리스트
			model.addAttribute("allBrandList", sellerMapper.getAllBrandList());
			if (sellerId!=null) { // 브랜드를 선택하면 브랜드별 후기 출력
				List<ReviewVO> list= reviewMapper.getReviewListByBrand(sellerId);
				model.addAttribute("reviewList", list);
			} else if (sellerId==null) { // 브랜드를 선택하지 않으면 최신순으로 모든 리뷰 출력
				List<ReviewVO> list = reviewMapper.getAllReviewList();
				model.addAttribute("reviewList", list);
			}
			return "manager/views/review-list.tiles";
		}
	}
	
	// 후기 상세 보기
	@RequestMapping("getDetailReview")
	public String getDetailReview(Model model, String reviewNo) {
		ReviewVO detailReview = reviewMapper.getDetailReview(reviewNo);
		model.addAttribute("detailReview", detailReview);
		return "manager/views/detail-review.tiles";
	}
	
	@RequestMapping("deleteReview")
	@ResponseBody
	public String deleteReview(Model model, int reviewNo) {
		reviewMapper.deleteReview(reviewNo);
		return "삭제완료";
	}
	
}
