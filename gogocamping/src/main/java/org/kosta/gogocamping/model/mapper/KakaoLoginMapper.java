package org.kosta.gogocamping.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.KakaoLoginVO;

@Mapper
public interface KakaoLoginMapper {

	void registerKakao(String customerId, String customerName, String kakaoEmail); 
	
	KakaoLoginVO findKakaoId(String kakaoEmail);
	
	void kakaoRegisterCustomer(String customerId, String customerName, String customerEmail, String customerTel, String customerBirth, String customerPostNumber, String customerAddress, String customerDetailedAddress);
}
