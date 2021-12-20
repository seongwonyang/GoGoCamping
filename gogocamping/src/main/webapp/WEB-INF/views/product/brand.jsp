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
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>${brand}</h4>
                            <ul>
                            <c:forEach items="${brandCategoryList}" var="c">
                                <li><a href="getProductListByBrand?brand=${c.sellerVO.brand}&category=${c.categoryVO.categoryName}&option=">${c.categoryVO.categoryName}</a></li>        
                                <input type="hidden" id="category" value="${category.categoryVO.categoryName}">
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
                           <div class="col-lg-4 col-md-6 col-sm-6">
                               <div class="product__item">
                                   <div class="product__item__pic set-bg" data-setbg="${product.productImg}">
                                       <ul class="product__item__pic__hover">
                                           <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                           <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                           <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                       </ul>
                                   </div>
                                   <div class="product__item__text">
                                       <h6><a href="#">${product.productName}</a></h6>
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
<script type="text/javascript">
   function sortProduct(i) {
      var category = document.getElementById("category").value;
      location.href = "getProductListByBrand?brand=${brand}&category="+category+"&option="+i;
   }
</script>
</body>
