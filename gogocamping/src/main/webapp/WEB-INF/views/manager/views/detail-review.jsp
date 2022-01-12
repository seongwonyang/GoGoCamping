<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
th, td {
	text-align: center
}
</style>

<body>
	<!-- Breadcrumb Section Begin -->
	<div class="container">
		<div class="row h-100">
			<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
				<div class="hero__search">
					<div class="#">
						<div class="section-title product__discount__title">
							<br>
							<br>
							<h3>구매 후기 상세</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 후기 내용 -->
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="text-align:center;">항목</th>
					<th style="text-align:center;">내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>상품명</td>
					<td>${detailReview.productVO.productName}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${detailReview.reviewContent}</td>
				</tr>
				<tr>
					<td>별점</td>
					<td>${detailReview.grade}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${detailReview.customerVO.customerId}</td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td>${detailReview.reviewRegdate}</td>
				</tr>
			</tbody>
		</table>
		<div style="text-align:center">
			<button type="button" class="btn btn-danger" id="reviewDeleteBtn">삭제</button>
		</div><br><br>
	</div>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$("#reviewDeleteBtn").click(function() {
			if(confirm("삭제하시겠습니까?")==true) {
				$.ajax({
					type:"post",
					url:"/manager/deleteReview",
					data:"reviewNo="+'${detailReview.reviewNo}',
					success: function(checkDelete) {
						if(checkDelete=="삭제완료") {
							$(location).attr("href","/manager/reviewManagement");
						}
					}
				});
			} else {
				return false;
			}
		});
	});
</script>
</body>
