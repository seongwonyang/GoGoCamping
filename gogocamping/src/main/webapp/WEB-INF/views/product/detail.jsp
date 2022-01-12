<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- <fmt:formatNumber value="${price}" pattern="#,###" /> -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/img/camp.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>${sellerVO.brand}</h2>
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
                            <div class="product__details__pic__item--large">
	                        	<c:choose>
	                        		<c:when test="${fn:startsWith(productVO.productImgStored, 'http')}">
	                        			<img src="${productVO.productImgStored}">
	                        		</c:when>
	                        		<c:otherwise>
	                        			<img src="../static/image/product_img/${productVO.productImgStored}">
	                        		</c:otherwise>
	                        	</c:choose>
	                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${productVO.productName}</h3>
                        <input type="hidden" id="detailProductId" value="${productVO.productId}">
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
                            <span>(${reviewCount} reviews)</span>
                        </div>
                        <div class="product__details__price"><fmt:formatNumber value="${productVO.price}" pattern="#,###" />원</div>
                        <p>[ ${sellerVO.brand} ] ${productVO.productName}</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" id="detailProductCount" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="#none" id="insertToCart" class="primary-btn">ADD TO CART</a>
                        <c:choose>
                        	<c:when test="${checkSameProductInLikes==0}">
                        		<a href="#none"><img id="heartIcon" src="/img/likes/dislikes.png" style="width:30px;"></a>
                        	</c:when>
                        	<c:otherwise>
                        		<a href="#none"><img id="heartIcon" src="/img/likes/likes.png" style="width:30px;"></a>
                        	</c:otherwise>
                        </c:choose>
                        <ul>
                            <li><b>재고량 :</b> <span>${productVO.stock} 개</span></li>
                            <li><b>판매자 :</b> <span>${sellerVO.brand}</span></li>
                            <li><b>분류 :</b> <span>${categoryName}</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                        	<c:choose>
                        		<c:when test="${option == 'product' || option == 'delivery'}">
                        			<li class="nav-item">
		                                <a class="nav-link" data-toggle="tab" href="#tabs-1" role="tab"
		                                    aria-selected="true" onclick="removeOption()">상품 정보</a>
		                            </li>
		                            <li class="nav-item">
		                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
		                                    aria-selected="false">리뷰( ${reviewCount} )</a>
		                            </li>
		                            <li class="nav-item">
		                                <a class="nav-link active" data-toggle="tab" href="#tabs-3" role="tab"
		                                    aria-selected="false">QnA( ${qnaCount} )</a>
		                            </li>
                        		</c:when>
                        		<c:when test="${option == 'highStar' || option == 'lowStar' || option == 'recent'}">
                        			<li class="nav-item">
		                                <a class="nav-link" data-toggle="tab" href="#tabs-1" role="tab"
		                                    aria-selected="true" onclick="removeOption()">상품 정보</a>
		                            </li>
		                            <li class="nav-item">
		                                <a class="nav-link active" data-toggle="tab" href="#tabs-2" role="tab"
		                                    aria-selected="false">리뷰( ${reviewCount} )</a>
		                            </li>
		                            <li class="nav-item">
		                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
		                                    aria-selected="false">QnA( ${qnaCount} )</a>
		                            </li>
                        		</c:when>
                        		<c:otherwise>
                        			<li class="nav-item">
		                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
		                                    aria-selected="true" onclick="removeOption()">상품 정보</a>
		                            </li>
		                            <li class="nav-item">
		                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
		                                    aria-selected="false">리뷰( ${reviewCount} )</a>
		                            </li>
		                            <li class="nav-item">
		                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
		                                    aria-selected="false">QnA( ${qnaCount} )</a>
		                            </li>
                        		</c:otherwise>
                        	</c:choose>            
                        </ul>
                        <div class="tab-content">
                        	<c:choose>
                        		<c:when test="${option != ''}">
                            		<div class="tab-pane" id="tabs-1" role="tabpanel">
                            	</c:when>
                            	<c:otherwise>
                            		<div class="tab-pane active" id="tabs-1" role="tabpanel">
                            	</c:otherwise>
                            </c:choose>
                                <div class="product__details__tab__desc">
                                    <h6>상품 정보</h6>
                                    <p>${productVO.productInfo}</p>
                                </div>
                            </div>
                            <c:choose>
                        		<c:when test="${option == 'highStar' || option == 'lowStar' || option == 'recent'}">
                            		<div class="tab-pane active" id="tabs-2" role="tabpanel">
                            	</c:when>
                            	<c:otherwise>
                            		<div class="tab-pane" id="tabs-2" role="tabpanel">
                            	</c:otherwise>
                            </c:choose>
                                <div class="product__details__tab__desc">
                                    <h3><b>Review</b></h3><hr>
									    <div class="form-group">
									      <select class="form-control" id="reviewOption" name="sortOption" onchange="changeReviewOption()">
									      	<option value="recent" ${option == 'recent' ? 'selected="selected"' : ''}>최신순</option>
									        <option value="highStar" ${option == 'highStar' ? 'selected="selected"' : ''}>별점높은순</option>
									        <option value="lowStar" ${option == 'lowStar' ? 'selected="selected"' : ''}>별점낮은순</option>
									      </select>						      
									      <br><br>
									    </div>
                                    <c:forEach items="${reviewList}" var="review">
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
                                    <p><b>${fn:substring(review.customerVO.customerId, 0, 3)}****</b>&nbsp;&nbsp;&nbsp;${review.reviewRegdate}</p>
                                    <p>${review.reviewContent}</p>
                                    <hr>
                                    </c:forEach>
                                </div>
                            </div>
                            <c:choose>
                        		<c:when test="${option == 'product' || option == 'delivery'}">
                            		<div class="tab-pane active" id="tabs-3" role="tabpanel">
                            	</c:when>
                            	<c:otherwise>
                            		<div class="tab-pane" id="tabs-3" role="tabpanel">
                            	</c:otherwise>
                            </c:choose><br>
                              <form action="/QnA/writePage" id="writeQuestionPage" name="writeQuestionPage" method="get">
                              <input type="hidden" name="productId" value="${productVO.productId}">
							    <div class="form-group">
							      <select class="form-control" id="qnaOption" name="sortOption" onchange="changeQnAOption()">
							      	<option value="default" ${option == '' ? 'selected="selected"' : ''} disabled="disabled">문의유형</option>
							        <option value="product" ${option == 'product' ? 'selected="selected"' : ''}>상품문의</option>
							        <option value="delivery" ${option == 'delivery' ? 'selected="selected"' : ''}>배송문의</option>
							      </select>
							      <button type="button" class="btn btn-light" onclick="qnaLoginCheck()" style="float: right;">글쓰기</button>							      
							      <br><br>
							    </div>
							  </form>
                                <div class="product__details__text">                               
                                    <h3>QnA</h3>
                                      <table class="table">
									    <tbody>
									    <c:forEach items="${qnaList}" var="qna" varStatus="status">
									      <tr>
									        <td style="border-right: 0.8px solid #FAFAFA; text-align: center;">${status.count}</td>
									        <c:choose>
									        	<c:when test="${sessionScope.loginVO.customerId == qna.customerVO.customerId}">
									        		<td onclick="openContent(this)"><b style="color:#575757;">&nbsp;[ ${qna.qnaCategory} ]</b> ${qna.title}</td>
									        	</c:when>
									        	<c:otherwise>
									        		<td><b style="color:#575757;"><img alt="" src="/static/image/lock.png">&nbsp;[ ${qna.qnaCategory} ]</b> ${qna.title}</td>
									        	</c:otherwise>
									        </c:choose>
									        <td>${qna.regdate}</td>
									        <td>${fn:substring(qna.customerVO.customerName, 0, 1)}**</td>
									      </tr>
									      <tr style="display:None;">
									      	<td></td>
									      	<td colspan="3">
									      		&nbsp;${qna.content}
									      	</td>
									      </tr>
									      <tr style="display:None;">
									      	<td bgcolor="#FAFAFA"></td>
									      	<td colspan="3" bgcolor="#FAFAFA">
									      		&nbsp;${qna.answer}
									      	</td>
									      </tr>
									      </c:forEach>
									    </tbody>
									  </table>
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
                	<c:forEach items="${relatedProductList}" var="product">
	                    <div class="col-lg-3" onclick="location.href='/product/getProductDetailInfo?productId=${product.productId}&sortOption='">
	                        <div class="categories__item set-bg">
	                        	<c:choose>
	                        		<c:when test="${fn:startsWith(product.productImgStored, 'http')}">
	                        			<img src="${product.productImgStored}">
	                        		</c:when>
	                        		<c:otherwise>
	                        			<img src="../static/image/product_img/${product.productImgStored}">
	                        		</c:otherwise>
	                        	</c:choose>
	                        	<h5><a href="#">${product.productName}</a></h5>
	                        </div>
	                    </div>
	                </c:forEach>
                </div>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$("#insertToCart").click(function() { // 장바구니 담기
			if(${sessionScope.loginVO==null}) {
		      alert("로그인이 필요한 서비스입니다.");
		    } else {
				let detailProductId = document.getElementById("detailProductId").value;
				let detailProductCount = document.getElementById("detailProductCount").value;
				$.ajax({
					type:"post",
					url:"/cart/insertProductInCart",
					data:"productId="+detailProductId+"&productCount="+detailProductCount,
					success:function(){
						let goToCartPage = confirm("상품이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?");
						if(goToCartPage) {
							location.href="/cart/list";
						} 
					}
				});//ajax
		    }
		});//insertToCart

  $("#heartIcon").click(function() { // 찜하기 버튼 클릭
    if(${sessionScope.loginVO==null}) {
      alert("로그인이 필요한 서비스입니다.");
    } else {
      $.ajax({
        type:"post",
        url:"/likes/likesAndEmptyLikes",
        data:"customerId="+'${sessionScope.loginVO.customerId}'+"&productId="+'${productVO.productId}',
        success: function(checkLikes) {
          if(checkLikes==1) { // 찜목록에 추가되면
            $("#heartIcon").attr("src","/img/likes/likes.png");
          } else { // 찜목록에서 삭제되면
            $("#heartIcon").attr("src","/img/likes/dislikes.png");
          }
        }
      });//ajax
    }//else
  });//heartIcon

});
	
function changeQnAOption() {
	let o = document.getElementById("qnaOption");
	let option = o.options[o.selectedIndex].value; 
	location.href = "/product/getProductDetailInfo?productId="+'${productVO.productId}'+"&sortOption="+option;
}

function changeReviewOption(){
	let o = document.getElementById("reviewOption");
	let option = o.options[o.selectedIndex].value;
	location.href = "/product/getProductDetailInfo?productId="+'${productVO.productId}'+"&sortOption="+option;
}

function openContent(elm){
	if ($(elm).parent().next().attr("style") == "display:None;") {
        $(elm).parent().next().attr("style", "display:visible;");
        $(elm).parent().next().next().attr("style", "display:visible;");
    } else if ($(elm).parent().next().attr("style") == "display:visible;") {
        $(elm).parent().next().attr("style", "display:None;");
        $(elm).parent().next().next().attr("style", "display:None;");
	}	
}

function removeOption() {
	location.href = "/product/getProductDetailInfo?productId="+'${productVO.productId}'+"&sortOption=";
}

function qnaLoginCheck() {
	var form = document.writeQuestionPage;
	
	if(${sessionScope.loginVO == null}) {
		alert("로그인이 필요한 서비스입니다.");
	} else {
		form.submit();
	}
}
</script>
</body>

