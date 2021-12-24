package org.kosta.gogocamping.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.OrderInfoVO;

@Mapper
public interface OrderMapper {

	void insertOrderInfo(OrderInfoVO orderInfoVO);

	void insertOrderDetail(OrderDetailVO orderDetailVO);

}
