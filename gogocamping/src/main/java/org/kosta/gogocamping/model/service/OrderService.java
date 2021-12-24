package org.kosta.gogocamping.model.service;

import org.kosta.gogocamping.model.domain.CartVO;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.OrderInfoVO;
import org.springframework.ui.Model;

public interface OrderService {

	CartVO getCheckedProductListInCart(int cartNo);

	int getProductStockCount(int productId);

	void insertOrderInfo(OrderInfoVO orderInfoVO);

	int getProductPrice(int productId);

	void order(OrderDetailVO orderDetailVO, int productId, int productCount, int cartNo);

	void getTotalInfo(String customerId, Model model);

}
