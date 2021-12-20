package org.kosta.gogocamping.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.CustomerVO;

@Mapper
public interface CustomerMapper {

	public CustomerVO loginCustomer(String customerId, String customerPassword);

	void registerCustomer(String customerId, String customerPassword, String customerName, String customerEmail, String customerTel, String customerBirth, String customerPostNumber, String customerAddress, String customerDetailedAddress);
	
	public CustomerVO findCustomerId(String customerId);

	public CustomerVO findCustomerIdByEmail(String customerName, String customerEmail);
	
	public CustomerVO findCustomerIdByTel(String customerName, String customerTel);

	public CustomerVO findPassword(CustomerVO customerVO);
	
	void updatePassword(String customerPassword, String customerId);

}
