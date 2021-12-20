package org.kosta.gogocamping.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.ManagerVO;
import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.ManagerMapper;
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
}
