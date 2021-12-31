package org.kosta.gogocamping.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.gogocamping.model.domain.CartVO;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.OrderInfoVO;
import org.kosta.gogocamping.model.mapper.CartMapper;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.OrderMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderMapper orderMapper;
	@Resource
	private ProductMapper productMapper;
	@Resource
	private CartMapper cartMapper;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private CategoryMapper categoryMapper;
	
	@Override
	public CartVO getCheckedProductListInCart(int cartNo) { // 장바구니에서 체크된 상품 리스트 조회
		return cartMapper.getCheckedProductListInCart(cartNo);
	}
	
	@Override
	public int getProductStockCount(int productId) { // 해당 상품 재고량 조회
		return productMapper.getProductStockCount(productId);
	}
	
	@Override
	public void insertOrderInfo(OrderInfoVO orderInfoVO) { // 주문
		orderMapper.insertOrderInfo(orderInfoVO);
	}
	
	@Override
	public int getProductPrice(int productId) { // 해당 상품 가격 조회
		return productMapper.getProductDetailInfo(productId).getPrice();
	}
	
	@Override
	@Transactional
	public void order(OrderDetailVO orderDetailVO, int productId, int productCount, int cartNo) { // 주문
		// 1. 주문 상세 정보 insert
		orderMapper.insertOrderDetail(orderDetailVO);
		// 2. 상품 재고량 감소
		Map<String, Object> map = new HashMap<>();
		map.put("productId", productId);
		map.put("productCount", productCount);
		productMapper.updateProductStockCount(map);
		// 3. 장바구니에서 주문한 상품 삭제
		cartMapper.deleteProductInCart(cartNo);
	} 
	
	@Override
	public List<OrderDetailVO> selectOrderList(String customerId){ // 주문 조회
		return orderMapper.selectOrderList(customerId); 
	}
	
	@Override
	public void buyConfirm(int orderDetailNo) {
		orderMapper.buyConfirm(orderDetailNo); // 구매확정
	}
	
	@Override
	@Transactional
	public void cancelOrder(int orderDetailNo, int productId, int orderCount) {
		orderMapper.updateToOrderCancelStatus(orderDetailNo); // 주문취소
		orderMapper.updateStockCount(orderCount, productId); // 주문취소 후 취소 상품 재고량 증가
	} 
	
}
