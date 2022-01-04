<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- <fmt:formatNumber value="${price}" pattern="#,###" /> -->
<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/img/camp.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Go Go Camping</h2>
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
            	<c:forEach items="${allProductList}" var="product">
	                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
	                    <div class="featured__item" onclick="location.href='/product/getProductDetailInfo?productId=${product.productId}&sortOption='">
	                        <div>
								<img src="${product.productImgStored}">
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
									href="/product/getAllProductList?pageNo=${pagingBean.startPageOfPageGroup-1}&option=${option}"><<</a></li>
							</c:if>
							<c:forEach begin="${pagingBean.startPageOfPageGroup}"
								end="${pagingBean.endPageOfPageGroup}" var="page">
								<c:choose>
									<c:when test="${page == pagingBean.nowPage}">
										<li class="page-item active"><a class="page-link"
											href="/product/getAllProductList?pageNo=${page}&option=${option}">${page}</a></li>
										<input type="hidden" id="pageNo" value="${page}">
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="/product/getAllProductList?pageNo=${page}&option=${option}">${page}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pagingBean.nextPageGroup}">
								<li class="page-item"><a class="page-link"
									href="/product/getAllProductList?pageNo=${pagingBean.endPageOfPageGroup+1}&option=${option}">>></a></li>
							</c:if>
						</ul>
		            </div><%-- 페이징 처리 --%>
            	</div>
        	</div>
    	</div>
    </section>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function sortProduct(i) {
		var pageNo = document.getElementById("pageNo").value;
		location.href = "/product/getAllProductList?pageNo="+pageNo+"&option="+i;
	}
	
	
	function getDetailCategory(i){
		var category = document.getElementById("categorySelect").value;
		alert(category);
	}
</script>
</body>

