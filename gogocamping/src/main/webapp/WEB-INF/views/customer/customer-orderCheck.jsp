<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div align="center">
		<h3 style="font-weight: 700;">주문조회</h3>
	</div>
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                	<th>주문번호</th>
                                    <th class="shoping__product">상품명</th>
                                    <th>주문일자</th>
                                    <th>수량</th>
                                    <th>총 가격</th>
                                    <th>배송상태</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orderList }" var="order">
                                <tr>
                                	<td>
                                		${order.orderInfoVO.orderNo }<br>
                                		<img src="${order.productVO.productImg}" alt="" onclick="location.href='/product/getProductDetailInfo?productId=${order.productVO.productId}&sortOption='">
                                	</td>
                                    <td class="shoping__cart__prices">
                                   
                                        <h5 onclick="location.href='/product/getProductDetailInfo?productId=${order.productVO.productId}&sortOption='">${order.productVO.productName}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${order.orderInfoVO.orderDate}
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${order.orderCount}
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${order.orderPrice}	
                                    </td>
                                    <td class="shoping__cart__quantity">
										${order.deliveryStatus}
                                    </td>
                                    <c:choose>
                                    <c:when test="${order.deliveryStatus == '주문완료'}">
	                                    <td class="shoping__cart__price">
	                                    	<form id="submitId" action="orderCheck" method="get">
	                                    		<input type="hidden" name="customerId" id="customerId" value="${sessionScope.loginVO.customerId}">
	                                    	</form>
                                    		<input type="hidden" id="productId" name="productId" value="${order.productVO.productId}">
                                    		<input type="hidden" id="orderCount" name="orderCount" value="${order.orderCount}">
                                    		<a class="orderCancel" data-detailno="${order.orderDetailNo}" data-ordercount="${order.orderCount}" data-productid="${order.productVO.productId}">
                                    		<button type="button" class="site-btn" style="width: 100px; height: 50px; background-color: #245207; border-radius: 10px;">주문취소</button></a>
	                                    </td>
	                                    <td></td>
	                                </c:when>
                                    <c:when test="${order.deliveryStatus == '배송준비중'}">
                                   	 	<td></td>
                                    	<td></td>
                                    </c:when>
                                    <c:when test="${order.deliveryStatus == '배송중'}">
                                   	 	<td></td>
                                    	<td></td>
                                    </c:when>
                                    <c:when test="${order.deliveryStatus == '배송완료'}">
	                                    <td class="shoping__cart__price">
	                                    	<input type="hidden" name="orderDetailNo" id="orderDetailNo" value="${order.orderDetailNo}">
	                                    	<form id="submitId" action="orderCheck" method="get">
	                                    		<input type="hidden" name="customerId" id="customerId" value="${sessionScope.loginVO.customerId}">
	                                    	</form>
	                                    		<a class="buyConfirm" data-detailno="${order.orderDetailNo}">
	                                    		<button type="button" class="site-btn" style="width: 110px; height: 50px; background-color: #245207; border-radius: 10px;">구매확정</button></a>
	                                    </td>
	                                    <td class="shoping__cart__price">
	                                    	<button type="button" onclick="location.href=/refund/writePage?orderDetailNo='${order.orderDetailNo}'" class="site-btn" style="width: 110px; height: 50px; background-color: #245207; border-radius: 10px;">교환/환불</button>
	                                    </td>
                                    </c:when>
                                    <c:when test="${order.deliveryStatus == '주문취소'}">
                                   	 	<td></td>
                                    	<td></td>
                                    </c:when>
                                    <c:when test="${order.deliveryStatus == '환불요청'}">
                                   	 	<td></td>
                                    	<td></td>
                                    </c:when>
                                    <c:when test="${order.deliveryStatus == '구매확정'}">
                                    <td class="shoping__cart__price">
                                   		<form action="/review/writePage" id="writeReviewPage" name="writeReviewPage" method="get">
			                            	<input type="hidden" name="productId" value="${order.productVO.productId}">
										    <button type="submit" class="site-btn" style="width: 100px; height: 50px; background-color: #245207; border-radius: 10px;">리뷰작성</button>						      
								    	</form> 
                                    </td>
                                    <td></td>
                                    </c:when>
                                    </c:choose>
                                </tr>
                                </c:forEach>
                              </tbody>
                        </table>
                    </div>
                </div>
            </div>
          </div>
    </section>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        //구매확정
    	$(function(){
    		$(".buyConfirm").click(function() {
    			if (!confirm("구매를 확정하시겠습니까?")) {
    	            return false;
    	        } else {
    	        	$("#orderDetailNo").val($(this).data('detailno'));
    	        }
    			$.ajax({
					type:"post",
					url:"/order/buyConfirm",
					data:"orderDetailNo="+$(this).data('detailno'),
					success:function(result){
						if(result=="구매확정"){
							$("#submitId").submit();
						}
					}
				});//ajax
    		});//click
    		//주문취소
    		
    		$(".orderCancel").click(function() {
    			if (!confirm("주문을 취소하시겠습니까?")) {
    	            return false;
    	        } else {
    	        	$("#orderDetailNo").val($(this).data('detailno'));
        			$("#productId").val($(this).data('productid'));
        			$("#orderCount").val($(this).data('ordercount'));
    	        }
    			$.ajax({
					type:"post",
					url:"/order/orderCancel",
					data:"orderDetailNo="+$(this).data('detailno')+"&productId="+$(this).data('productid')+"&orderCount="+$(this).data('ordercount'),
					success:function(result){
						if(result=="주문취소"){
							$("#submitId").submit();
						}
					}
				});//ajax
    		});//click
    	});//ready
    </script>
</body>