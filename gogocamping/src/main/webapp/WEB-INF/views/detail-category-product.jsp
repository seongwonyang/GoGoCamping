<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
<section class="product spad">
	<div class="container">
		 <div class="row">
		 	<div class="col-lg-12">
		 		<div class="section-title">
		 			<h2>Detail Category</h2>
		 		</div>
		 		<div class="featured__controls">
		 			<ul>
		 				<c:forEach items="${detailCategory}" var="detailCategory">
		 					<li><a href="detailCategoryProduct?categoryName='${detailCategory.categoryName }'&detailCategoryName='${detailCategory.detailCategoryName}'">${detailCategory.detailCategoryName}</a></li>
		 				</c:forEach>
		 			</ul>
		 		</div>
		 	</div>
		</div>
		<div class="col-lg-12 col-md-7">
			<div class="row featured__filter">
				<c:forEach items="${categoryProduct}" var="product">
					<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
						<div class="featured__item">
							<div class="featured__item__pic set-bg" data-setbg="${product.productImg}">
								<ul class="featured__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="featured__item__text">
								<h6><a class="move" href="#">${product.productName}</a></h6>
								<h5>${product.price}</h5>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
</body>