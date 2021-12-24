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
                                    <th class="shoping__product">상품정보</th>
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
                                    <td class="shoping__cart__item">
                                        <img src="${order.productVO.productImg}" alt="">
                                        <h5>${order.productVO.productName}	</h5>
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
                                    <c:when test="${order.refundCheck eq 0}">
                                    <td class="shoping__cart__price">
                                    	<input type="hidden" name="orderDetailNo" id="orderDetailNo" value="${order.orderDetailNo}">
                                    	<form id="submitId" action="orderCheck" method="get">
                                    		<input type="hidden" name="customerId" id="customerId" value="${sessionScope.loginVO.customerId}">
                                    	</form>
                                    	<button type="button" class="site-btn" id="buyConfirm" style="width: 100px; height: 50px; background-color: #245207; border-radius: 10px;">구매확정</button>
                                    </td>
                                    </c:when>
                                    <c:otherwise>
                                    <td class="shoping__cart__price">
                                    	<button type="button" class="site-btn" style="width: 100px; height: 50px; background-color: #245207; border-radius: 10px;">후기작성</button>
                                    </td>
                                    <td class="shoping__cart__price">
                                    	<button type="button" class="site-btn" style="width: 110px; height: 50px; background-color: #245207; border-radius: 10px;">교환/환불</button>
                                    </td>		
                                    </c:otherwise>
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
    	$(function(){
    		$("#buyConfirm").click(function(){
    			$.ajax({
					type:"get",
					url:"buyConfirm",
					data:"orderDetailNo="+$("#orderDetailNo").val(),
					success:function(result){
						if(result=="구매확정"){
							$("#submitId").submit();
						}
					}
				});//ajax
    		});
    	});
    </script>
</body>