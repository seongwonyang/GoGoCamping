<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <h2>Go Go Camping for ${sessionScope.sellerVO.brand}</h2>
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
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>상품 정보 관리</h2>
                        </div>
                        <div class="row">
                    <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>상품 번호</th>
                                    <th>카테고리</th>
                                    <th>상품명</th>
                                    <th>가격</th>
                                    <th>재고량</th>
                                    <th></th>
                                </tr>
                            </thead>
	                            <tbody>
	                            <c:forEach items="${getSellerProductList}" var="product">
	                                <tr>
	                                    <td>
	                                        ${product.productId}
	                                        <form id="UpdateProductForm2" action="/seller/updateProductForm">
                        						<input type="hidden" id="productId" name="productId" value="">
                       						</form>
	                                    </td>
	                                    <td>
	                                        ${product.categoryVO.categoryName}<br>
	                                        ${product.categoryVO.detailCategoryName}                                        
	                                    </td>
	                                    <td>
	                                        ${product.productName}
	                                    </td>
	                                    <td>
	                                        ${product.price}
	                                    </td>
	                                    <td>
	                                        ${product.stock}
	                                    </td>
	                                    <td>
	                                    	<a class="updateProductBtn" data-productid="${product.productId}">
		                                    	<button type="button" class="site-btn" style="background-color: #065E93; border-radius: 10px;">
		                                    		상품 정보 수정
		                                    	</button>
	                                    	</a>
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
    <!-- Product Section End -->
</body>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		
		$(function(){		
			$('.updateProductBtn').on('click', function() {
			    var tabType = $(this).data('productid');
			    $("#productId").val($(this).data('productid'));
			    
			    $("#UpdateProductForm2").submit();
			});
		});
	</script>
