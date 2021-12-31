package org.kosta.gogocamping.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.OrderInfoVO;

@Mapper
public interface OrderMapper {

	void insertOrderInfo(OrderInfoVO orderInfoVO); // 주문

	void insertOrderDetail(OrderDetailVO orderDetailVO); // 주문
	
	List<OrderDetailVO> selectOrderList(String customerId); // 주문조회
	
	void updateToOrderCancelStatus(int orderDetailNo); // 주문취소
	
	void updateStockCount(int orderCount ,int productId); // 주문취소 후 취소 상품 재고량 증가
	
	void buyConfirm(int orderDetailNo); // 구매확정
	
	OrderDetailVO getProductInfoByOrderDetailNo(int orderDetailNo);

	void updateStatusOrderDetail(int orderDetailNo);

}
