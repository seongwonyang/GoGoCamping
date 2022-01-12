<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- <fmt:formatNumber value="${price}" pattern="#,###" /> -->
<body>
<section class="">
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
                           	<option value="" selected="selected">신상품순</option>
                          		<option value="popular" ${option == 'popular' ? 'selected="selected"' : ''}>인기순</option>
                          		<option value="low" ${option == 'low' ? 'selected="selected"' : ''}>낮은 가격순</option>
       							<option value="high" ${option == 'high' ? 'selected="selected"' : ''}>높은 가격순</option>
                           </select>
                       </div>
                   </div>
                   <div class="col-lg-4 col-md-4">
                       <div class="filter__found">
                           <h6><span>${totalCount}</span> Products found</h6>
                       </div>
                   </div>
                   <div class="col-lg-4 col-md-3">
                       <div class="filter__option">
                       </div>
                   </div>
               </div>
            </div>
			<div class="row featured__filter">
				<c:forEach items="${productListByCategory}" var="product">
					<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat" onclick="location.href='/product/getProductDetailInfo?productId=${product.productId}&sortOption='">
						<div class="featured__item">
							<div>
	                        	<c:choose>
	                        		<c:when test="${fn:startsWith(product.productImgStored, 'http')}">
	                        			<img src="${product.productImgStored}">
	                        		</c:when>
	                        		<c:otherwise>
	                        			<img src="../static/image/product_img/${product.productImgStored}">
	                        		</c:otherwise>
	                        	</c:choose>
	                        </div>
							<div class="featured__item__text">
								<h6><a class="move" href="#">${product.productName}</a></h6>
								<h5><fmt:formatNumber value="${product.price}" pattern="#,###" />원</h5>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		    <div><%-- 페이징 처리 --%>
			  <ul class="pagination justify-content-center" style="margin: 20px 0">
				  <c:if test="${pagingBean.previousPageGroup}">
					  <li class="page-item"><a class="page-link"
						  href="/category/categoryProduct?categoryName=${categoryName }&pageNo=${pagingBean.startPageOfPageGroup-1}&option=${option}"><<</a></li>
				  </c:if>
				  <c:forEach begin="${pagingBean.startPageOfPageGroup}"
					  end="${pagingBean.endPageOfPageGroup}" var="page">
					  <c:choose>
						  <c:when test="${page == pagingBean.nowPage}">
							  <li class="page-item active"><a class="page-link"
								  href="/category/categoryProduct?categoryName=${categoryName }&pageNo=${page}&option=${option}">${page}</a></li>
							  <input type="hidden" id="pageNo" value="${page}">
						  </c:when>
						  <c:otherwise>
							  <li class="page-item"><a class="page-link"
								  href="/category/categoryProduct?categoryName=${categoryName }&pageNo=${page}&option=${option}">${page}</a></li>
						  </c:otherwise>
					  </c:choose>
				  </c:forEach>
				  <c:if test="${pagingBean.nextPageGroup}">
					  <li class="page-item"><a class="page-link"
						  href="/category/categoryProduct?categoryName=${categoryName }&pageNo=${pagingBean.endPageOfPageGroup+1}&option=${option}">>></a></li>
				  </c:if>
			  </ul>
           </div><%-- 페이징 처리 --%><br>
		</div>
	</div>
</section>
<script type="text/javascript">
	function sortProduct(i) {
		var pageNo = document.getElementById("pageNo").value;
		location.href = "/category/categoryProduct?categoryName="+'${categoryName }'+"&pageNo="+pageNo+"&option="+i;
	}
</script>
</body>