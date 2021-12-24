<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>브랜드 로고</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${productVO.productImg }" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${productVO.productName }</h3>
                        <div class="product__details__rating">
                        <c:choose>
                        	<c:when test="${avgReview < 1}">
                       			<i class="fa fa-star">리뷰 없음</i>
                       		</c:when>
                       		<c:when test="${avgReview < 2}">
                       			<i class="fa fa-star"></i>
                       		</c:when>
                       		<c:when test="${avgReview < 3}">
                       			<i class="fa fa-star"></i>
                       			<i class="fa fa-star"></i>
                       		</c:when>
                       		<c:when test="${avgReview < 4}">
                       			<i class="fa fa-star"></i>
                       			<i class="fa fa-star"></i>
                       			<i class="fa fa-star"></i>
                       		</c:when>
                       		<c:when test="${avgReview < 5}">
                       			<i class="fa fa-star"></i>
                       			<i class="fa fa-star"></i>
                       			<i class="fa fa-star"></i>
                       			<i class="fa fa-star"></i>
                       		</c:when>
                       		<c:otherwise>
                       			<i class="fa fa-star"></i>
                       			<i class="fa fa-star"></i>
                       			<i class="fa fa-star"></i>
                       			<i class="fa fa-star"></i>
                       			<i class="fa fa-star"></i>
                       		</c:otherwise>
                        </c:choose>
                            <span>(${reviewCount } reviews)</span>
                        </div>
                        <div class="product__details__price">${productVO.price } </div>
                        <p>[ ${sellerVO.brand} ] ${productVO.productName }</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">ADD TO CARD</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                            <li><b>재고량 :</b> <span>${productVO.stock} 개</span></li>
                            <li><b>판매자 :</b> <span>${sellerVO.brand}</span></li>
                            <li><b>Weight</b> <span>0.5 kg</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">상품 정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">리뷰( ${reviewCount } )</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">QnA</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>상품 정보</h6>
                                    <p>${productVO.productInfo }</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>리뷰</h6>
                                    <c:forEach items="${reviewList }" var="review">
                                    <p><b>${review.customerVO.customerId }</b>&nbsp;&nbsp;&nbsp;${review.reviewRegdate }</p>
                                    <div class="product__details__text">
	                                    <div class="product__details__rating">
	                                    	<c:choose>
	                                    		<c:when test="${review.grade < 2}">
	                                    			<i class="fa fa-star"></i>
	                                    		</c:when>
	                                    		<c:when test="${review.grade < 3}">
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    		</c:when>
	                                    		<c:when test="${review.grade < 4}">
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    		</c:when>
	                                    		<c:when test="${review.grade < 5}">
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    			<i class="fa fa-star"></i>
	                                    		</c:otherwise>
					                        </c:choose>
	                                    </div>
	                                </div>
                                    <p>${review.reviewContent }</p>
                                    <hr>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>상품 문의</h6>
                                    <c:forEach items="${qnaList }" var="qna">
                                    	<p><b>${qna.customerVO.customerId }</b>&nbsp;&nbsp;&nbsp;${qna.regdate }</p>
                                    <div class="product__details__text">
	                                    <b>[ ${qna.qnaCategory} ] ${qna.title }</b>
	                                </div><br>
                                    	<p>${qna.content }</p>
                                    <hr>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="categories__slider owl-carousel">
                	<c:forEach items="${relatedProductList }" var="product">
	                    <div class="col-lg-3" onclick="location.href='getProductDetailInfo?productId=${product.productId}'">
	                        <div class="categories__item set-bg" data-setbg="${product.productImg }">
	                            <h5><a href="#">${product.productName }</a></h5>
	                        </div>
	                    </div>
	                </c:forEach>
                </div>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
    
    
</body>