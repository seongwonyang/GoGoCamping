<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib
	prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="/img/camp.png">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Go Go Camping for ${sessionScope.sellerVO.brand}</h2>
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
							<h2>전체 판매 내역</h2>
						</div>
						<div>
							<input type="date" id="startDate"> ~ <input type="date"
								id="lastDate">
							<button type="button" id="searchByDateBtn">검색</button>
						</div>
						<br>
						<br>
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
											</tr>
										</thead>
										<tbody id="totalSoldListResult">
											<c:set var="totalPrice" value="0" />
											<c:forEach items="${totalSoldList}" var="soldList">
												<tr>
													<td>
														<!-- 주문번호 --> ${soldList.orderInfoVO.orderNo}
													</td>
													<td>
														<!-- 상품명 --> ${soldList.productVO.productName}
													</td>
													<td>
														<!-- 주문 수량 --> ${soldList.orderCount}
													</td>
													<td>
														<!-- 주문 일자 --> ${soldList.orderInfoVO.orderDate}
													</td>
													<td>
														<!-- 결제 금액 --> <fmt:formatNumber
															value="${soldList.orderPrice}" pattern="#,###" />
													</td>
												</tr>
												<c:set var="totalPrice"
													value="${totalPrice + soldList.orderPrice}" />
											</c:forEach>

										</tbody>
									</table>
									<br>
									<div class="section-title product__discount__title">
										<h5 style="text-align: right;">
											총 판매 금액 :
											<span id="totalPrice"><fmt:formatNumber value="${totalPrice}" pattern="#,###" /></span>
											원
										</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

<script>
document.getElementById('lastDate').valueAsDate = new Date();
</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$("#searchByDateBtn").click(
			function() {
				// 검색 시작 날짜 가져오기
				let startDate = $("#startDate").val();
				// 검색 마지막 날짜 가져오기
				let lastDate = $("#lastDate").val();
				if (startDate == "" || lastDate == "") { // 날짜를 입력하지 않은 경우
					alert("날짜를 입력하세요");
				} else if(startDate>lastDate) {
					alert("시작 날짜가 마지막 날짜보다 클 수 없습니다");
				} else {
					$.ajax({
						type : "post",
						url : "/seller/getTotalSoldListByDate",
						datatype : "json",
						data : "&startDate=" + startDate
								+"&lastDate=" + lastDate,
						success : function(data) {
							let code = "";
							let total = 0;
							for(let i=0; i<data.length; i++){
								code += "<tr>";
								code += "<td>"+data[i].orderDetailNo+"</td>";
								code += "<td>"+data[i].productVO.productName+"</td>";
								code += "<td>"+data[i].orderCount+"</td>";
								code += "<td>"+data[i].orderInfoVO.orderDate+"</td>";
								code += "<td>"+data[i].orderPrice+"</td>";
								code += "</tr>";
								total += data[i].orderPrice;
							}
							$("#totalSoldListResult").html(code);
							$("#totalPrice").text(total);
						}
					});//ajax
				}//else
			});
	});
</script>
</body>
