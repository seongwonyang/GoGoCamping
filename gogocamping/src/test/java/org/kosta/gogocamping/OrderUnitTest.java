package org.kosta.gogocamping;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.OrderInfoVO;
import org.kosta.gogocamping.model.mapper.CartMapper;
import org.kosta.gogocamping.model.mapper.OrderMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class OrderUnitTest {
	
	@Resource
	OrderMapper orderMapper;
	@Resource
	ProductMapper productMapper;
	@Resource
	CartMapper cartMapper;
	
	@Test
	void getProductStockCount() { // 1. 상품 재고량 조회 select
		int productId = 1;
		System.out.println(productMapper.getProductStockCount(productId));
	}
	
	@Test
	void insertOrderInfo() { // 2. 주문 정보 insert
		OrderInfoVO orderInfoVO = new OrderInfoVO();
		orderMapper.insertOrderInfo(orderInfoVO);
	}
	
	@Test
	void insertOrderDetail() { // 3. 주문 상세 정보 insert
		OrderDetailVO orderDetailVO = new OrderDetailVO();	
		orderMapper.insertOrderDetail(orderDetailVO);
	}
	
	@Test
	void updateProductStockCount() { // 4. 상품 재고량 감소 update
		Map<String, Object> map = new HashMap<>();
		map.put("productId", 1);
		map.put("productCount", 1);
		productMapper.updateProductStockCount(map);
	}
	
	@Test
	void deleteOrderedProductInCart() { // 5. 장바구니에서 주문한 상품 삭제 delete
		int cartNo = 1;	
		cartMapper.deleteProductInCart(cartNo);
	}
	
}
