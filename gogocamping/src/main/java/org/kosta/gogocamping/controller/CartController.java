package org.kosta.gogocamping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CartVO;
import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.CartMapper;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Resource
	private CartMapper cartMapper;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private CategoryMapper categoryMapper;
	
	@ModelAttribute("allBrandList")
	public List<SellerVO> allBrandList() {
		return sellerMapper.getAllBrandList(); // 전체 브랜드 리스트
	}
	@ModelAttribute("categoryList")
	public List<CategoryVO> categoryList() {
		return categoryMapper.getCategoryList(); // 전체 카테고리 리스트
	}
	
	@RequestMapping("/list")
	public String getProductListInCart(HttpServletRequest request, Model model) { // 장바구니 확인
		HttpSession session = request.getSession(false);
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginVO");
		
		model.addAttribute("productListInCart", cartMapper.getProductListInCart(customerVO.getCustomerId())); // 장바구니 목록
		model.addAttribute("totalCountInCart", cartMapper.getTotalCountInCart(customerVO.getCustomerId())); // 장바구니에 담긴 총 상품수
		
		return "customer/cart.tiles";
	}
	
	@RequestMapping("/getCheckedProductTotalPrice") 
	@ResponseBody
	public int getCheckedProductTotalPriceInCart(@RequestParam List<Integer> checkList) { 
		int cartNo, productPrice, productCount, checkedTotalPrice = 0;
		
		for(int i=0; i<checkList.size(); i++) {
			cartNo = checkList.get(i);
			productPrice = cartMapper.getCheckedProductPrice(cartNo); // 해당 상품 가격
			productCount = cartMapper.getCheckedProductCount(cartNo); // 해당 상품 개수
			checkedTotalPrice += productPrice * productCount; 
		}
	    return checkedTotalPrice;
	}
	
	@RequestMapping("/getTotalPriceInCart")
	@ResponseBody
	public int getTotalPriceInCart(HttpServletRequest request) { // 전체 상품 가격 합계
		HttpSession session = request.getSession(false);
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginVO");
		
		int totalPrice = 0;
		List<CartVO> list = cartMapper.getProductListInCart(customerVO.getCustomerId()); // 장바구니 목록

		for(int i=0; i<list.size(); i++) {
			totalPrice += list.get(i).getProductVO().getPrice() * list.get(i).getProductCount();
		}
		return totalPrice;
	}
	
	@RequestMapping("/insertProductInCart")
	@ResponseBody
	public void insertProductInCart(HttpServletRequest request, int productId, int productCount) { // 장바구니 담기
		HttpSession session = request.getSession(false);
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginVO");
		  
		Map<String, Object> map = new HashMap<>(); 
		map.put("customerId", customerVO.getCustomerId()); 
		map.put("productId", productId);
		map.put("productCount", productCount);
		  
		// 장바구니에 같은 상품이 있는지 확인 
		if(cartMapper.checkSameProductInCart(map) == 0) { //같은 상품이 없을 경우 (결과값 0) 
			cartMapper.insertProductInCart(map); 
		} else { // 같은 상품이 있을 경우 (수량만 증가)
			cartMapper.UpdateProductInCart(map); 
		}  
	} 
	
	@RequestMapping("/deleteCheckedProduct")
	@ResponseBody
	public int deleteCheckedProduct(@RequestParam List<Integer> checkedDeleteList) { // 선택 상품 삭제
		int result = 0; // 선택된 상품이 없을 때 0 반환
		
		if(checkedDeleteList.size() != 0) { // 선택된 상품이 있을 경우에만 실행
			result = 1;
			for(int i=0; i<checkedDeleteList.size(); i++) {
				cartMapper.deleteProductInCart(checkedDeleteList.get(i));
			}
		}
		return result;
	}
	
	@RequestMapping("/deleteProduct")
	@ResponseBody public void deleteProduct(int cartNo) { // 개별 상품 삭제
		cartMapper.deleteProductInCart(cartNo); 
	}
	 
	@RequestMapping("/plusProductCount")
	@ResponseBody
	public void plusProductCountInCart(int cartNo) { // 상품 수량 변경
		cartMapper.plusProductCountInCart(cartNo);
	}
	
	@RequestMapping("/minusProductCount")
	@ResponseBody
	public void minusProductCountInCart(int cartNo) { // 상품 수량 변경
		cartMapper.minusProductCountInCart(cartNo);
	}
	
}
