<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- <fmt:formatNumber value="${price}" pattern="#,###" /> -->
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
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>${brand}</h4>
                            <ul>
                            <c:forEach items="${brandCategoryList}" var="c">
                                <li><a href="/product/getProductListByBrand?brand=${c.sellerVO.brand}&category=${c.categoryVO.categoryName}&option=">${c.categoryVO.categoryName}</a></li>        
                                <input type="hidden" id="category" value="${c.categoryVO.categoryName}">
                            </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
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
                                    <h6><span>${fn:length(productListByBrand)}</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                        <%-- 쓸라면 쓰고 --%>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                       <c:forEach items="${productListByBrand}" var="product">
                           <div class="col-lg-4 col-md-6 col-sm-6" onclick="location.href='/product/getProductDetailInfo?productId=${product.productId}&sortOption='">
                               <div class="product__item">
                                   <div class="product__item__pic set-bg" data-setbg="${product.productImg}">
                                       <ul class="product__item__pic__hover">
                                       </ul>
                                   </div>
                                   <div class="product__item__text">
                                       <h6><a href="#">${product.productName}</a></h6>
                                       <h5><fmt:formatNumber value="${product.price}" pattern="#,###" />원</h5>
                                   </div>
                               </div>
                           </div>
                       </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
<script type="text/javascript">
   function sortProduct(i) {
      location.href = "/product/getProductListByBrand?brand=${brand}&category="+'${category}'+"&option="+i;
   }
</script>
</body>
