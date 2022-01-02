<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- <fmt:formatNumber value="${price}" pattern="#,###" /> -->
<body>
<section class="product spad">
	<div class="container">
		 <div class="row">
		 	<div class="col-lg-12">
		 		<div class="section-title">
		 			<h2>Detail Category</h2>
		 		</div>
		 		<div class="featured__controls">
			 		<nav class="header__menu">
			 			<ul>
			 				<c:forEach items="${detailCategoryList}" var="detailCategory">
			 					<li><a href="/category/detailCategoryProduct?categoryName=${detailCategory.categoryName }&detailCategoryName=${detailCategory.detailCategoryName}&option=" style="color: black">${detailCategory.detailCategoryName}</a></li>
			 				</c:forEach>
			 			</ul>
			 		</nav>
		 		</div>
		 	</div>
		</div>
		<div class="col-lg-12 col-md-7">
			<div class="filter__item"><!-- 전체 상품리스트 조회 -->
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <select id="sort" onchange="sortProduct(this.value)">
                                   	<option value="" selected="selected" disabled="disabled">----정렬----</option>
                                   		<option value="popular" ${option == 'popular' ? 'selected="selected"' : ''}>인기순</option>
								        <option value="high" ${option == 'high' ? 'selected="selected"' : ''}>높은 가격순</option>
								        <option value="low" ${option == 'low' ? 'selected="selected"' : ''}>낮은 가격순</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found"><!-- 
                                    <h6><span>16</span> Products found</h6>
                                 --></div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <!-- <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span> -->
                                </div>
                            </div>
                        </div>
                    </div>
			<div class="row featured__filter">
				<c:forEach items="${productListByDetailCategory}" var="product">
					<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat" onclick="location.href='/product/getProductDetailInfo?productId=${product.productId}&sortOption='">
						<div class="featured__item">
							<div class="featured__item__pic set-bg" data-setbg="${product.productImg}">
								<ul class="featured__item__pic__hover">
								</ul>
							</div>
							<div class="featured__item__text">
								<h6><a class="move" href="#">${product.productName}</a></h6>
								<h5><fmt:formatNumber value="${product.price}" pattern="#,###" />원</h5>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	function sortProduct(i) {
		location.href = "/category/detailCategoryProduct?categoryName="+'${categoryName}'+"&detailCategoryName="+'${detailCategoryName}'+"&option="+i;
	}
</script>
</body>