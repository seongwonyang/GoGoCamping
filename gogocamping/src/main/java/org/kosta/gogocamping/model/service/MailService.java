package org.kosta.gogocamping.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.mapper.CustomerMapper;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MailService {
	@Resource
	private JavaMailSender javaMailSender;
	@Resource 
	private CustomerMapper customerMapper;
	
	@Transactional
	public void sendMail(String customerId, String customerEmail, String str) {
		ArrayList<String> toUserList = new ArrayList<>();
		
		CustomerVO cvo = new CustomerVO(customerId, customerEmail);
		
		CustomerVO customerVO = customerMapper.findPassword(cvo);
		
		toUserList.add(customerVO.getCustomerEmail());
		
		int toUserSize = toUserList.size();
		
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		
		simpleMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));
		
		simpleMessage.setSubject("고고캠핑 비밀번호 재설정 인증코드 발급 이메일 입니다.");
		
		simpleMessage.setText("안녕하세요. 고고캠핑 인증코드 안내 관련 이메일 입니다.\n"+" ["+customerVO.getCustomerId()+"]"+" 님의 인증코드는 "+str+"입니다. \n"+"비밀번호 변경후 이용부탁드립니다.");
		
		javaMailSender.send(simpleMessage);
		
		//customerMapper.updatePassword(str, customerId);
	}
}
