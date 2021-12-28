package org.kosta.gogocamping.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.NaverLoginVO;

@Mapper
public interface NaverLoginMapper {
	
	void registerNaver(String customerId, String customerName, String naverEmail); 
	
	NaverLoginVO findNaverId(String naverEmail);
	
	void naverRegisterCustomer(String customerId, String customerName, String customerEmail, String customerTel, String customerBirth, String customerPostNumber, String customerAddress, String customerDetailedAddress);
}
