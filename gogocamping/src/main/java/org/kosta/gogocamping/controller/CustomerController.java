package org.kosta.gogocamping.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.CustomerMapper;
import org.kosta.gogocamping.model.mapper.OrderMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.kosta.gogocamping.model.service.MailService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Resource
	private CustomerMapper customerMapper;
	@Resource
	private MailService service;
	@Resource
	private ProductMapper productMapper;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private CategoryMapper categoryMapper;
	@Resource
	private OrderMapper orderMapper;
	
	@ModelAttribute("allBrandList")
	public List<SellerVO> allBrandList() {
		return sellerMapper.getAllBrandList(); // 전체 브랜드 리스트
	}
	@ModelAttribute("categoryList")
	public List<CategoryVO> categoryList() {
		return categoryMapper.getCategoryList(); // 전체 카테고리 리스트
	}
	
	@RequestMapping("/loginForm")
	public String loginForm(Model model) {
		return "customer/customer-login.tiles";
	}
	
	@RequestMapping("/login")
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
	
	@RequestMapping("/logout")
	public String logoutCustomer(HttpSession session, Model model) {
		session.removeAttribute("loginVO");
		session.removeAttribute("naverVO");
		session.removeAttribute("kakaoVO");
		
		return "redirect:/";
	}

	@RequestMapping("/registerCustomerForm")
	public String registerCustomerForm(Model model) {
		return "customer/customer-register-form.tiles";
	}
	
	@RequestMapping("/registerForm")
	public String registerForm(Model model) {
		return "customer/register-form.tiles";
	}
	
	@RequestMapping("/checkId")
	@ResponseBody
	public String checkId(String customerId) {
		CustomerVO customerVO = customerMapper.findCustomerId(customerId);
		if(customerVO == null) {
			return "사용가능한 아이디입니다.";
		}else {
			return "중복된아이디 입니다.";
		}
	}
	
	@RequestMapping("/register") 
	public String registerCustomer(String customerId, String customerPassword, String customerName, String customerEmail, String customerTel, String customerBirth, String customerPostNumber, String customerAddress, String customerDetailedAddress, Model model) {
		customerMapper.registerCustomer(customerId, customerPassword, customerName, customerEmail, customerTel, customerBirth, customerPostNumber, customerAddress, customerDetailedAddress);
		return "redirect:/";
	}

	@RequestMapping("/findIdForm")
	public String customerFindIdForm(Model model) {
		return "customer/customer-find-id-form.tiles";
	}
	
	@RequestMapping("/findIdByEmail")
	public String customerFindIdByEmail(Model model) {
		return "customer/customer-find-id-byEmail.tiles";
	}
	
	@RequestMapping("/findIdByTel")
	public String customerFindIdByTel(Model model) {
		return "customer/customer-find-id-byTel.tiles";
	}
	
	@RequestMapping("/getCustomerIdByEmail")
	public String getCustomerIdByEmail(String customerName, String customerEmail, Model model) {
		CustomerVO customerVO = customerMapper.findCustomerIdByEmail(customerName, customerEmail);
		model.addAttribute("customerVO", customerVO);
		return "customer/customer-result-byEmail.tiles";
	}
	
	@RequestMapping("/getCustomerIdByTel")
	public String getCustomerIdByTel(String customerName, String customerTel, Model model) {
		model.addAttribute("customerVO", customerMapper.findCustomerIdByTel(customerName, customerTel));

		return "customer/customer-result-byTel.tiles";
	}
	
	@RequestMapping("/resetCustomerPassword")
	public String resetCustomerPassword(String customerId, String customerPassword, HttpSession session, Model model) {
		session.removeAttribute("athCode");
		session.removeAttribute("checkId");
		customerMapper.updatePassword(customerPassword, customerId);

		return "redirect:/";
	}
	
	@RequestMapping("/findPasswordForm")
	public String customerFindPasswordForm(Model model) {
		return "customer/customer-findPassword-form.tiles";
	}
	
	@RequestMapping("/findPassword")
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
	
	@RequestMapping("/emailCode")
	public String emailCode(Model model) {
		return "customer/customer-emailCode-form.tiles";
	}
	
	@RequestMapping("/resetPassword")
	public String resetPassword(Model model) {
		return "customer/customer-passwordRest.tiles"; // 수정필요
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
	
	@RequestMapping("/updateInfoForm") //정보수정폼으로 이동
	public String updateInfoForm(Model model, String customerId) {
		model.addAttribute("customerInfo", customerMapper.findCustomerId(customerId));

		return "customer/customer-update-info.tiles";
	}
	
	@RequestMapping("/updateInfo") //정보수정
	public String updateInfo(String customerId, String customerEmail, String customerTel, String customerPostNumber, String customerAddress, String customerDetailedAddress,Model model) {
		CustomerVO cvo=new CustomerVO(customerId,null, null, customerEmail, customerTel, customerPostNumber, customerAddress, customerDetailedAddress,null, null);
		customerMapper.updateInfo(cvo);
		model.addAttribute("customerInfo", customerMapper.findCustomerId(customerId));

		return "customer/customer-update-info.tiles";
	}
	
	@RequestMapping("/updatePassword") //비밀번호수정폼으로 이동
	public String updatePassword(Model model, String customerId) {
		model.addAttribute("passwordUpdate", customerMapper.equals(customerId));

		return "customer/customer-update-password.tiles";
	}
	
	@RequestMapping("/updateNewPassword") //비밀번호 수정
	public String updateNewPassword(String customerId, String customerPassword, HttpSession session, Model model) {
		customerMapper.updatePassword(customerPassword, customerId);
		session.removeAttribute("loginVO");

		return "redirect:/";
	}	
	
}
