<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- <fmt:formatNumber value="${price}" pattern="#,###" /> -->
<body>
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/img/camp.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
			<div class="col-lg-12">
               <div class="shoping__cart__btns">
                   <a href=#></a>
                   <a href=# id="deleteCheckedProduct" class="primary-btn cart-btn cart-btn-right">선택 삭제</a>
                   <!-- <button type="button" id="deleteCheckedProduct" class="primary-btn cart-btn cart-btn-right">선택 삭제</button> -->
               </div>
            </div><br><br><br>
            <%-- <input type="hidden" name="productListInCart" value="${productListInCart.cartNo}"> --%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                	<th><input type="checkbox" name="checkAll" id="checkAll"></th>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>       
                            <tbody> 
                            <c:forEach items="${productListInCart}" var="cart">
                                <tr>
                                	<td>
                                		<input type="checkbox" value="${cart.cartNo}" name="chk" checked="checked">
                                	</td>
                                    <td class="shoping__cart__item">
                                        <div>
				                        	<c:choose>
				                        		<c:when test="${fn:startsWith(cart.productVO.productImgStored, 'http')}">
				                        			<img style="height: 100px; width: 100px;" src="${cart.productVO.productImgStored}" onclick="location.href='/product/getProductDetailInfo?productId=${cart.productVO.productId}&sortOption='">
				                        		</c:when>
				                        		<c:otherwise>
				                        			<img style="height: 100px; width: 100px;" src="../static/image/product_img/${cart.productVO.productImgStored}">
				                        		</c:otherwise>
				                        	</c:choose>
				                        	<h5 onclick="location.href='/product/getProductDetailInfo?productId=${cart.productVO.productId}&sortOption='">${cart.productVO.productName}</h5>
				                        </div>    
                                    </td>
                                    <td class="shoping__cart__price">
                                    	<fmt:formatNumber value="${cart.productVO.price}" pattern="#,###" />원
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
	                                        <div class="pro-qty">
	                                            <span class="currentCount">
	                                            	<input type="text" value="${cart.productCount}" disabled="disabled">
	                                            	<input type="hidden" value="${cart.cartNo}">
	                                            </span>                   	              
	                                        </div>
                                        </div>   
                                    </td>
                                    <td class="shoping__cart__total" id="totalProductPrice">
                                    	<fmt:formatNumber value="${cart.productVO.price * cart.productCount}" pattern="#,###" />원
                                    </td>
                                    <td class="shoping__cart__item__close">          
                                    	<a href="" class="deleteProduct" data-cartno="${cart.cartNo}"><span class="icon_close"></span></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table><span id="multiPrint"></span><br/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="offset-6 col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>선택 상품 개수 <span id="checkedProductCount"></span></li>
                            <li>결제 금액 <span id="totalPrice"></span></li>
                        </ul>
                        <a href="#none" id="orderProduct" class="primary-btn">주문하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	if('${soldout}' == 'soldout'){ // 주문시 품절 상품 확인
		alert("선택 상품의 재고량이 부족하여 주문이 불가능합니다.");
		location.replace("getProductListInCart");
	}
	
 	$(document).ready(function() { // 장바구니에 담긴 전체 상품 가격, 개수 가져오기
		$("input[name=checkAll]").prop("checked", true);
		$.ajax({
			type:"get",
			url:"/cart/getTotalPriceInCart",
			success:function(result){
				$("#totalPrice").text(numberWithCommas(result)+"원");
				$("#checkedProductCount").text($("input[name=chk]:checked").length + "개");				
			}
		});//ajax
	});  
	
	$("#checkAll").click(function() { 
		if($("#checkAll").is(":checked")) { // 전체 선택 
			$("input[name=chk]").prop("checked", true);
			$.ajax({
				type:"get",
				url:"/cart/getTotalPriceInCart",
				success:function(totalPrice){
					$("#totalPrice").text(numberWithCommas(totalPrice)+"원");
					$("#checkedProductCount").text($("input[name=chk]:checked").length + "개");
				}
			});//ajax
		}
		else { // 전체 선택 해제
			$("input[name=chk]").prop("checked", false);
			$("#totalPrice").text("0원");
			$("#checkedProductCount").text($("input[name=chk]:checked").length + "개");
		}
	});

	$("input[name=chk]").click(function() { 
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked) { 
			$("#checkAll").prop("checked", false); 
			$("#totalPrice").text("0원");
			$("#checkedProductCount").text($("input[name=chk]:checked").length + "개");
		}
		else { 
			$("#checkAll").prop("checked", true);
			$.ajax({
				type:"get",
				url:"/cart/getTotalPriceInCart",
				success:function(totalPrice){
					$("#totalPrice").text(numberWithCommas(totalPrice)+"원");
					$("#checkedProductCount").text($("input[name=chk]:checked").length + "개");
				}
			});//ajax
		}//else 
	});
	
	$("input[name=chk]").change(function() { // 선택 상품 가격, 개수 가져오기
		var checkList = new Array();
		$('input[type="checkbox"]:checked').each(function (index) {
			checkList.push($(this).val());
        });
		if(checkList[0]=="on"){
			checkList.shift();
		}
		$.ajax({ 
			type:"get",
			url:"/cart/getCheckedProductTotalPrice",
			traditional : true,
			data: {"checkList" : checkList},
			success:function(checkedTotalPrice){
				$("#totalPrice").text(numberWithCommas(checkedTotalPrice)+"원");
				$("#checkedProductCount").text($("input[name=chk]:checked").length + "개");
			}
		});//ajax
	});
	
	$("#deleteCheckedProduct").click(function() { // 선택 상품 삭제
		var checkedDeleteList = new Array();
		$('input[type="checkbox"]:checked').each(function (index) {
			checkedDeleteList.push($(this).val());
        });
		
		if(checkedDeleteList[0]=="on"){
			checkedDeleteList.shift();
		}
		
		if(checkedDeleteList.length == 0) {
			alert("선택된 상품이 없습니다.");
		} else {
			var checkDelete = confirm("선택한 상품을 삭제하시겠습니까?");
			if(checkDelete) {
				$.ajax({
					type:"post",
					url:"/cart/deleteCheckedProduct",
					traditional : true,
					data: {"checkedDeleteList" : checkedDeleteList},
					success:function(result){
						if(result) {
							location.replace("/cart/list"); // 새로고침
						} else {
							alert("삭제 실패");
						}//else
					}//success
				});//ajax
			}//if(checkDelete)
		}//else
	});//deleteCheckedProduct
	
 	$(".currentCount").click(function() { // - + 사이 숫자부분 클릭 무효화
		//alert("클릭 무효화");
		event.stopImmediatePropagation();
	});//currentCount 
	
 	$(".deleteProduct").on('click', function() { // x 아이콘 클릭으로 상품 삭제
	    $.ajax({
			type:"post",
			url:"/cart/deleteProduct",
			data:"cartNo="+$(this).data('cartno'),
			success:function(){
				alert("선택한 상품이 삭제되었습니다.");
				location.reload();
			}
		});//ajax 
	});//deleteProduct 	
	
	$(".dec").on('click', function() { // -
		if($(this).next().children().val() == 1) {
			alert("더 이상 수량을 줄일 수 없습니다.");
			location.reload();
		} else {
			$.ajax({
				type:"post",
				url:"/cart/minusProductCount",
				data:"cartNo="+$(this).next().children().next().val(),
				success:function(){
					location.reload();
				}
			});//ajax
		}//else
	});//dec
	
	$(".inc").on('click', function() { // +
		$.ajax({
			type:"post",
			url:"/cart/plusProductCount",
			data:"cartNo="+$(this).prev().children().next().val(),
			success:function(){
				location.reload();
			}
		});//ajax
	});//inc

	$("#orderProduct").on('click', function() { // 주문하기
		if($("input[name=chk]:checked").length == 0){
			alert("선택된 상품이 없습니다.");
			return false;
		}
		var checkList = new Array();
		$('input[type="checkbox"]:checked').each(function (index) {
			checkList.push($(this).val());
        });
		if(checkList[0]=="on"){
			checkList.shift();
		}
		location.href = "/order/orderform?checkList="+checkList;
	});//orderProduct
});//ready

function numberWithCommas(x) { // 가격 천단위 콤마 표시
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>
