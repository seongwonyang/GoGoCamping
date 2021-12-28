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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
th, td {
	text-align: center;
	border-collapse : collapse;
}
#toc-content {
    display: none;
}

</style>
<body>
	<!-- Breadcrumb Section Begin -->
<section class="hero hero-normal">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars">
						</i>
						<span onclick="openBrandList">Brands</span>
					</div>
					<ul id="toc-content">
						<c:forEach items="${allBrandList}" var="brandList">
							<li>
								<a href="reviewManagement?sellerId='${brandList.sellerId}'">${brandList.brand}</a>
							</li>
						</c:forEach>
					</ul>
					<br>
					<h3>구매 후기</h3>
				</div>
			</div>
		</div>
	</div>
</section>
	
	<!-- 후기 리스트 -->
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="col-lg-3">상품명</th>
					<th class="col-lg-3">후기내용</th>
					<th class="col-lg-2">브랜드</th>
					<th class="col-lg-2">작성일자</th>
					<th class="col-lg-2">작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reviewList}" var="reviewList">
					<tr>
						<td style="width: 200px; text-align: left;">
							<img src="${reviewList.productVO.productImg}">  ${reviewList.productVO.productName}
						</td>
						<td>
							<a href="getDetailReview?reviewNo=${reviewList.reviewNo}">${reviewList.reviewContent}</a>
						</td>
						<td>${reviewList.productVO.sellerVO.sellerId} </td>
						<td style="width: 70px;" class="shoping__cart__price">${reviewList.reviewRegdate}</td>
						<td class="shoping__cart__total">${reviewList.customerVO.customerId}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script type="text/javascript">
		// 브랜드 펼치면 브랜드 리스트 보이기
		function openBrandList() {
			if(document.getElementById('toc-content').style.display === 'block') {
			      document.getElementById('toc-content').style.display = 'none';
			    } else {
			      document.getElementById('toc-content').style.display = 'block';
			    }
		}
	</script>
</body>
