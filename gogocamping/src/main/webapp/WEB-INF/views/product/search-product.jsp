<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                        <h2>Go Go Camping</h2>
                        <!-- <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shop</span>
                        </div> -->
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
                    <span><b><span style="color: green">'${keyword}' </span></b>에 대한 검색결과&nbsp;<%-- <b><span style="color: green">[${searchTotalProductCount}건]</span></b> --%></span><br><br>
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <select id="sort" onchange="sortProduct(this.value)">
                                    	<c:choose>
                                    		<c:when test="${option=='high'}">
		                                        <option value="high" selected="selected">높은 가격순</option>
		                                        <option value="low">낮은 가격순</option>
		                                    </c:when>
		                                    <c:when test="${option=='low'}">
		                                        <option value="high">높은 가격순</option>
		                                        <option value="low" selected="selected">낮은 가격순</option>
		                                    </c:when>
		                                    <c:otherwise>
		                                    	<option selected="selected" disabled>----정렬----</option>
		                                        <option value="high">높은 가격순</option>
		                                        <option value="low">낮은 가격순</option>
		                                    </c:otherwise>
										</c:choose>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>${fn:length(searchProductList)}</span> Products found</h6>
                                </div>
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
            	<c:forEach items="${searchProductList}" var="product">
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
    	</div>
    </section>
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$("#sort").change(function(){
			$.ajax({
				type:"get",
				url:"getSortedProductList",
				data:"option=" + $("#sort option:selected").val() +"&pageNo="+$("#pageNo").val(),
				success:function(sortedList) {
					console.log(sortedList);
				}
			});
		});
	});
</script> -->
<script type="text/javascript">
	function sortProduct(i) {
		location.href = "searchProductList?keyword=${keyword}&option="+i;
	}
</script>
</body>

