package org.kosta.gogocamping.model.service;

import java.util.List;

import org.kosta.gogocamping.model.domain.CartVO;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.OrderInfoVO;

public interface OrderService {

	CartVO getCheckedProductListInCart(int cartNo);

	int getProductStockCount(int productId);

	void insertOrderInfo(OrderInfoVO orderInfoVO);

	int getProductPrice(int productId);

	void order(OrderDetailVO orderDetailVO, int productId, int productCount, int cartNo);
	
	List<OrderDetailVO> selectOrderList(String customerId);

	void buyConfirm(int orderDetailNo);

	void cancelOrder(int orderDetailNo, int productId, int orderCount);

}
