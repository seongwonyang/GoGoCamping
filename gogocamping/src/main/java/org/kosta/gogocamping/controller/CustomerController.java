package org.kosta.gogocamping.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.mapper.CustomerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CustomerController {
	@Resource
	private CustomerMapper customerMapper;
	
	@RequestMapping("loginCustomerForm")
	public String loginCustomerForm() {
		return "customer/customer-login.tiles";
	}
	@RequestMapping("loginCustomer")
	@ResponseBody
	public String loginCustomer(String customerId, String customerPassword, HttpSession session) {
		CustomerVO customerVO = customerMapper.loginCustomer(customerId, customerPassword);
		if(customerVO == null) {
			return "아이디 또는 비밀번호를 확인하세요.";
		}else {
			session.setAttribute("loginVO", customerVO);
			return "로그인성공";
		}
	}
	@RequestMapping("logoutCustomer")
	public String logoutCustomer(HttpSession session) {
		session.removeAttribute("loginVO");
		return "home.tiles";
	}

	@RequestMapping("registerCustomerForm")
	public String registerCustomerForm() {
		return "customer/customer-register-form.tiles";
	}
	@RequestMapping("registerForm")
	public String registerForm() {
		return "customer/register-form.tiles";
	}
	@RequestMapping("checkId")
	@ResponseBody
	public String checkId(String customerId) {
		CustomerVO customerVO = customerMapper.findCustomerId(customerId);
		if(customerVO == null) {
			return "사용가능한 아이디입니다.";
		}else {
			return "중복된아이디 입니다.";
		}
	}
	@RequestMapping("registerCustomer") 
	public String registerCustomer(String customerId, String customerPassword, String customerName, String customerEmail, String customerTel, String customerBirth, String customerPostNumber, String customerAddress, String customerDetailedAddress) {
		customerMapper.registerCustomer(customerId, customerPassword, customerName, customerEmail, customerTel, customerBirth, customerPostNumber, customerAddress, customerDetailedAddress);
		return "home.tiles";
	}
}
