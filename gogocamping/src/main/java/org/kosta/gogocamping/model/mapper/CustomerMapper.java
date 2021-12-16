package org.kosta.gogocamping.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.CustomerVO;

@Mapper
public interface CustomerMapper {
	public CustomerVO loginCustomer(String customerId, String customerPassword);
}
