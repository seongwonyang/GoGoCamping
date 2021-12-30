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
import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.GenerateCertNumber;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.OrderInfoVO;
import org.kosta.gogocamping.model.domain.ProductVO;
import org.kosta.gogocamping.model.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController {
	@Resource
	OrderService orderService;
	
	@RequestMapping("orderProduct")
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
		
		return "customer/order.tiles";
	}
	
	@RequestMapping("order")
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
				orderService.getTotalInfo(customerVO.getCustomerId(), model);
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
			orderService.getTotalInfo(customerVO.getCustomerId(), model);

			model.addAttribute("orderList", orderService.orderCheck(customerVO.getCustomerId()));
		}
		return "redirect:orderCheck?customerId="+customerId; // 주문 성공 시 마이페이지 주문내역으로 이동
	}
	
}
