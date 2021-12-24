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
import org.kosta.gogocamping.model.mapper.CustomerMapper;
import org.kosta.gogocamping.model.mapper.OrderMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

@Service
public class OrderServiceImpl implements OrderService {
	@Resource
	OrderMapper orderMapper;
	@Resource
	ProductMapper productMapper;
	@Resource
	CartMapper cartMapper;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private CategoryMapper categoryMapper;
	@Resource
	private CustomerMapper customerMapper;
	
	@Override
	public CartVO getCheckedProductListInCart(int cartNo) {
		return cartMapper.getCheckedProductListInCart(cartNo);
	}
	
	@Override
	public int getProductStockCount(int productId) {
		return productMapper.getProductStockCount(productId);
	}
	
	@Override
	public void insertOrderInfo(OrderInfoVO orderInfoVO) {
		orderMapper.insertOrderInfo(orderInfoVO);
	}
	
	@Override
	public int getProductPrice(int productId) {
		return productMapper.getProductDetailInfo(productId).getPrice();
	}
	
	@Override
	@Transactional
	public void order(OrderDetailVO orderDetailVO, int productId, int productCount, int cartNo) {
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
	public void getTotalInfo(String customerId, Model model) {
		model.addAttribute("productListInCart", cartMapper.getProductListInCart(customerId)); // 장바구니 목록
		model.addAttribute("totalCountInCart", cartMapper.getTotalCountInCart(customerId)); // 장바구니에 담긴 총 상품수
		
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList()); // 브랜드 리스트
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트
	} 
	
	@Override
	public List<OrderDetailVO> orderCheck(String customerId){
		return customerMapper.orderCheck(customerId);
	}
	
}
