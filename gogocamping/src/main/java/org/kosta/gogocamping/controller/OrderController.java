package org.kosta.gogocamping.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CartVO;
import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.GenerateCertNumber;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.OrderInfoVO;
import org.kosta.gogocamping.model.domain.ProductVO;
import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.kosta.gogocamping.model.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Resource
	private OrderService orderService;
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
	
	@GetMapping("/orderform")
	public String orderProduct(HttpSession session, @RequestParam List<Integer> checkList, Model model) {
		List<CartVO> productList = new ArrayList<CartVO>();
		int totalPrice = 0; // 결제할 총 금액
		
		for(int i=0; i<checkList.size(); i++) {
			productList.add(orderService.getCheckedProductListInCart(checkList.get(i)));
			totalPrice += (orderService.getCheckedProductListInCart(checkList.get(i)).getProductCount()) * (orderService.getCheckedProductListInCart(checkList.get(i)).getProductVO().getPrice());
		}

		model.addAttribute("productList", productList);
		model.addAttribute("totalPrice", totalPrice);
		session.setAttribute("productList", productList);
		session.setAttribute("checkList", checkList);
		
		return "customer/order.tiles"; // 주문서 작성 및 결제 페이지로 이동
	}
	
	@PostMapping("/orderProduct")
	public String order(HttpServletRequest request, OrderInfoVO orderInfoVO, Model model) {
		HttpSession session = request.getSession(false);
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginVO");
		String customerId = customerVO.getCustomerId();
		@SuppressWarnings("unchecked")
		List<Integer> checkList = (List<Integer>) session.getAttribute("checkList");
		@SuppressWarnings("unchecked")
		List<CartVO> productList = (List<CartVO>) session.getAttribute("productList");

		for(int i=0; i<productList.size(); i++) {
			int stock = orderService.getProductStockCount(productList.get(i).getProductVO().getProductId()); // 재고량
			int orderCount = orderService.getCheckedProductListInCart(checkList.get(i)).getProductCount();
			//stock = 0; // 재고량 부족
			if(orderCount > stock) {
				model.addAttribute("soldout", "soldout");
				return "customer/cart.tiles"; // 품절시 장바구니로 이동
			} 
		}	
		// 주문번호 생성
		GenerateCertNumber ge = new GenerateCertNumber(); 
		ge.setCertNumLength(6);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddS", Locale.KOREA);
		String today = sdf.format(date); 
		
		String orderNo = today + ge.excuteGenerate(); // 주문번호
		
		orderInfoVO.setOrderNo(orderNo);
		customerVO.setCustomerId(customerId);
		orderInfoVO.setCustomerVO(customerVO);
		orderService.insertOrderInfo(orderInfoVO); // order_info에 주문정보 insert 
		
		// OrderdetailVO 생성
		OrderDetailVO orderDetailVO = new OrderDetailVO();
		for(int i=0; i<productList.size(); i++) {
			int productId = productList.get(i).getProductVO().getProductId();
			int orderCount = orderService.getCheckedProductListInCart(checkList.get(i)).getProductCount();
			
			orderDetailVO.setOrderCount(orderCount);
			orderDetailVO.setOrderPrice(orderService.getProductPrice(productId)*orderCount);
			orderDetailVO.setDeliveryStatus("주문완료");
			orderDetailVO.setRefundCheck(0);
			orderDetailVO.setOrderInfoVO(orderInfoVO);
			ProductVO productVO = new ProductVO();
			productVO.setProductId(productId);
			orderDetailVO.setProductVO(productVO);
			
			orderService.order(orderDetailVO, productId, orderCount, checkList.get(i));
		}
		return "redirect:/order/orderCheck?customerId="+customerId; // 주문 성공 시 마이페이지 주문조회 페이지로 이동
	}
	
	@RequestMapping("/orderCheck")
	public String orderCheck(String customerId, Model model) {
		List<OrderDetailVO> list = orderService.selectOrderList(customerId); // 주문조회
		model.addAttribute("orderList", list);
		return "customer/customer-orderCheck.tiles";
	}
	
	@RequestMapping("/buyConfirm")
	@ResponseBody
	public String buyConfirm(int orderDetailNo) {
		orderService.buyConfirm(orderDetailNo); // 구매확정
		return "구매확정";
	}
	
	@RequestMapping("/orderCancel")
	@ResponseBody
	public String orderConfirm(int orderDetailNo, int productId, int orderCount) { 
		orderService.cancelOrder(orderDetailNo, productId, orderCount);
		return "주문취소";
	}
	
}
