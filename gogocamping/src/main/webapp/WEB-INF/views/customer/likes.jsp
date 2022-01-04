<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- <fmt:formatNumber value="${price}" pattern="#,###" /> -->
<body>
    <!-- Page Preloder -->
   <!--  <div id="preloder">
        <div class="loader"></div>
    </div> -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/img/camp.png">
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
                        <div class="section-title product__likes__title">
                            <h2>찜한 상품 리스트</h2>
                        </div>
                    <div class="filter__item"><!-- 전체 상품리스트 조회 -->
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>${fn:length(likesList)}</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                            </div>
                        </div>
                    </div>
            	<div class="row featured__filter">
            	<c:forEach items="${likesList}" var="likes">
	                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
	                    <div class="featured__item">
	                        <div>
	                        	<c:choose>
	                        		<c:when test="${fn:startsWith(likes.productVO.productImgStored, 'http')}">
	                        			<img src="${likes.productVO.productImgStored}" onclick="location.href='/product/getProductDetailInfo?productId=${likes.productVO.productId}&sortOption='">
	                        		</c:when>
	                        		<c:otherwise>
	                        			<img src="../static/image/product_img/${likes.productVO.productImgStored}" onclick="location.href='/product/getProductDetailInfo?productId=${likes.productVO.productId}&sortOption='">
	                        		</c:otherwise>
	                        	</c:choose>
	                        </div>
	                        <div class="text-center">
	                        	<a href="#none" class="heartIcon" data-productid="${likes.productVO.productId}"><img id="heart${likes.productVO.productId}" src="/img/likes/likes.png" class="text-center" style="align:center; width:30px;"></a>
	                        	</div>
	                        <div class="featured__item__text">
		                        <h6><a class="move" href="#">${likes.productVO.productName}</a></h6>
		                        <h5><fmt:formatNumber value="${likes.productVO.price}" pattern="#,###" />원</h5>
	                      	</div>
	                    </div>
	                </div>
	            </c:forEach>
	            </div>
		            <div><%-- 페이징 처리 --%>
						<ul class="pagination justify-content-center" style="margin: 20px 0">
							<c:if test="${pagingBean.previousPageGroup}">
								<li class="page-item"><a class="page-link"
									href="/product/getAllProductList?pageNo=${pagingBean.startPageOfPageGroup-1}&option=${option}">Previous</a></li>
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
									href="/product/getAllProductList?pageNo=${pagingBean.endPageOfPageGroup+1}&option=${option}">Next</a></li>
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
	};
	$(function() {
		$(".heartIcon").on('click',function() {
			// productId값 가져오기
			let productId = $(this).data('productid');
			//alert(productId);
			//alert("${sessionScope.loginVO.customerId}");
			$.ajax({
				type:"post",
				url:"/likes/likesAndEmptyLikes",
				data:"customerId="+'${sessionScope.loginVO.customerId}'+"&productId="+$(this).data('productid'),
				success: function(checkLikes) {
					if(checkLikes==0) { // 찜목록에서 삭제되면
						$("#heart"+productId).attr("src","/img/likes/dislikes.png");
					} else { // 찜목록에 추가되면
						$("#heart"+productId).attr("src","/img/likes/likes.png");
					}
				}
			});
		});
	});
</script>
</body>

