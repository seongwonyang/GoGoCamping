package org.kosta.gogocamping.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.mapper.CustomerMapper;
import org.kosta.gogocamping.model.service.MailService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CustomerController {
	@Resource
	private CustomerMapper customerMapper;
	@Resource
	private MailService service;
	
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
	@RequestMapping("resetCustomerPassword")
	public String resetCustomerPassword(String customerId, String customerPassword, HttpSession session) {
		session.removeAttribute("athCode");
		session.removeAttribute("checkId");
		customerMapper.updatePassword(customerPassword, customerId);
		return "home.tiles";
	}
	@RequestMapping("customer-findPassword-form")
	public String customerFindPasswordForm() {
		return "customer/customer-findPassword-form.tiles";
	}
	@RequestMapping("findPassword")
	@ResponseBody
	public String findPassword(String customerId, String customerEmail, HttpSession session) {
		CustomerVO cvo = new CustomerVO(customerId, customerEmail);
		CustomerVO customerVO = customerMapper.findPassword(cvo);
		if(customerVO==null) {
			return "아이디 또는 이메일이 일치하지않습니다.";
		}else {
			String str = getTempPassword();
			session.setAttribute("athCode", str);
			session.setAttribute("checkId", customerVO);
			service.sendMail(customerId, customerEmail, str);
			return "인증코드 발송중입니다.";
		}
	}
	@RequestMapping("emailCode")
	public String emailCode() {
		return "customer/customer-emailCode-form.tiles";
	}
	@RequestMapping("resetPassword")
	public String resetPassword() {
		return "customer/customer-passwordRest.tiles";
	}
	public String getTempPassword(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String str = "";

        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }
}