<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
    <!-- Page Preloder -->
   <!--  <div id="preloder">
        <div class="loader"></div>
    </div> -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/camp.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Go Go Camping for ${sessionScope.loginVO.brand}</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>현재 주문 내역</h2>
                        </div>
                        
                        <div class="row">
                    <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>주문 번호</th>
                                    <th>상품명</th>
                                    <th>주문 수량</th>
                                    <th>주문 일자</th>
                                    <th>결제 금액</th>
                                    <th>배송 현황</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${getOrderList}" var="product" varStatus="index">
                            	<c:if test="${product.deliveryStatus != '배송완료'}">
	                                <tr>
	                                    <td>
	                                        ${product.orderInfoVO.orderNo}
	                                    </td>
	                                    <td>
	                                        ${product.productVO.productName}
	                                        <input type="hidden" id="productId" value="${product.productVO.productId}">
	                                    </td>
	                                    <td>
	                                        ${product.orderCount}
	                                    </td>
	                                    <td>
	                                        ${product.orderInfoVO.orderDate}
	                                    </td>
	                                    <td>
	                                        ${product.orderPrice}
	                                    </td>
	                                    <td>
	                                        <span id="deliveryStatusVal${index.count }">
			                                	<a onclick="btnChange('${product.orderDetailNo}', '${product.deliveryStatus}', '${index.count }')" type="button" class="site-btn" style="color: white; background-color: #065E93; border-radius: 10px;">${product.deliveryStatus}</a>
	                                        </span>
	                                    </td>
	                                </tr>
                                </c:if>
                                </c:forEach>
                            </tbody>
                        </table><br>
                    </div>
                </div>
            </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    <!-- Product Section End -->
</body>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	    function btnChange(orderDetailNo, deliveryStatus, index) {
	    	$.ajax({
		        type:"post",
		        url:"updateDeliveryStatus",
		        //dataType:"json",
		        data: "orderDetailNo="+orderDetailNo+"&deliveryStatus="+deliveryStatus,
		        success : function(result){
		           console.log(result);
		           if(result!="") {
		        	   if(result=="noSession") {
		        		   $(location).attr('href','SellerHome');
		        		   return;
					   }else if(result=="배송완료") {
						   var btnText = '<a onclick="#" type="button" class="site-btn" style="color: white; background-color: black; border-radius: 10px;">' + result + '</a>';		        		   
		        	   }else {		        		   
		        	       var btnText = '<a onclick="btnChange(\'' + orderDetailNo + '\', \'' + result + '\')" type="button" class="site-btn" style="color: white; background-color: #065E93; border-radius: 10px;">' + result + '</a>';
		        	   }
		        	   $("#deliveryStatusVal"+index).html(btnText);
		           }else {
		        	   alert(result);
		           }
	      		} // success
    		}); //ajax
	    }
	</script>
	
	
	
	
	
	
	
	
	
	
	