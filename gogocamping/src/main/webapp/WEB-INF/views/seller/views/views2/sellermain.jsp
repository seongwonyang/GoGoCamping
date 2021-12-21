<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <h2>Go Go Camping for ${sessionScope.loginVO.brand}</h2>
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
                                </tr>
                            </thead>
                            <c:forEach items="" var="product">
	                            <tbody>
	                                <tr>
	                                    <td>
	                                        ${productVO.productId }
	                                    </td>
	                                    <td>
	                                        ${productVO.categoryVO.categoryName }<br>
	                                        ${productVO.categoryVO.detailcategoryName }                                        
	                                    </td>
	                                    <td>
	                                        ${productVO.productName }
	                                    </td>
	                                    <td>
	                                        ${productVO.price }
	                                    </td>
	                                    <td>
	                                        ${productVO.stock }
	                                    </td>
	                                    <td><button type="button" class="site-btn" style="background-color: #065E93; border-radius: 10px;">상품 정보 수정</button></td>
	                                </tr>
	                            </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    <!-- Product Section End -->

</body>
