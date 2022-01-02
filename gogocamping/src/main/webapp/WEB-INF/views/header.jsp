<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<body>
    <!-- Page Preloder -->
    <!-- <div id="preloder">
        <div class="loader"></div>
    </div> -->

    <!-- Humberger Begin -->
<!--     <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li><a href="">텐트/타프</a></li>
                <li><a href="">의자/테이블/침대</a></li>
                <li><a href="">버너/코펠/주방용품</a></li>
                <li><a href="">랜턴/화로/연료</a></li>
                <li><a href="">침낭/매트/해먹</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> email us</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div> -->
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> email us</li>
                                <li>Enjoy your own Camping Life!</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                           <c:choose>
                            <c:when test="${sessionScope.loginVO==null}">
                            
                            <div class="header__top__right__social">
                                <a href="/customer/loginForm"><i class="fa fa-user"></i> Login</a>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="/customer/registerForm"><i class="fa fa-user"></i> 회원가입</a>
                            </div>
                            </c:when>
                            <c:when test="${sessionScope.naverVO!=null}">
                            <div class="header__top__right__social">
		                        <a href="/likes/list?customerId=${sessionScope.loginVO.customerId}"><i class="fa fa-heart"></i> <span></span></a>
		                        <a href="/cart/list"><i class="fa fa-shopping-bag"></i> <span></span></a>
                            </div>
                            <div class="header__top__right__auth">
                             <nav class="header__menu">
                        	<ul>
                            	<li style="text-align:center"><a href="#">마이페이지&nbsp;&nbsp;&nbsp;</a>
                                	<ul class="header__menu__dropdown">
                                    	<li><a href="#" id="orderCheck">주문조회</a></li>
                                	</ul>
                            	</li>
                            	</ul>
                            	</nav>
                            	<form id="/order/orderCheckForm" action="/order/orderCheck" method="get">
                            	<input type="hidden" id="customerId" name="customerId" value="${sessionScope.loginVO.customerId}">
                            	</form>
                            	</div>
                            	${sessionScope.loginVO.customerName}님&nbsp;&nbsp;&nbsp;
                            	<a href="/customer/logout">logout</a>
                            </c:when>
                            <c:when test="${sessionScope.kakaoVO!=null }">
                            <div class="header__top__right__social">
		                        <a href="/likes/list?customerId=${sessionScope.loginVO.customerId}"><i class="fa fa-heart"></i> <span></span></a>
		                        <a href="/cart/list"><i class="fa fa-shopping-bag"></i> <span></span></a>
                            </div>
                            <div class="header__top__right__auth">
                             <nav class="header__menu">
                        	<ul>
                            	<li style="text-align:center"><a href="#">마이페이지&nbsp;&nbsp;&nbsp;</a>
                                	<ul class="header__menu__dropdown">
                                    	<li><a href="#" id="orderCheck">주문조회</a></li>
                                	</ul>
                            	</li>
                            	</ul>
                            	</nav>
                            	<form id="orderCheckForm" action="/order/orderCheck" method="get">
                            	<input type="hidden" id="customerId" name="customerId" value="${sessionScope.loginVO.customerId}">
                            	</form>
                            	</div>
                            	${sessionScope.loginVO.customerName}님&nbsp;&nbsp;&nbsp;
                            	<a href="/customer/logout">logout</a>
                            </c:when>
                            <c:otherwise>
                             <div class="header__top__right__social">
                              <a href="/likes/list?customerId=${sessionScope.loginVO.customerId}"><i class="fa fa-heart"></i> <span></span></a>
                              <a href="/cart/list"><i class="fa fa-shopping-bag"></i> <span></span></a>
                            </div>
                            <div class="header__top__right__auth">
                             <nav class="header__menu">
                        	<ul>
                            	<li style="text-align:center"><a href="#">마이페이지&nbsp;&nbsp;&nbsp;</a>
                                	<ul class="header__menu__dropdown">
                                    	<li><a href="#" id="updateInfo">정보수정</a></li>
                                    	<li><a href="#" id="updatePassword">비밀번호수정</a></li>
                                    	<li><a href="#" id="orderCheck">주문조회</a></li>
                                	</ul>
                            	</li>
                            	</ul>
                            	</nav>
                            	<form id="customerInfoForm" action="/customer/updateInfoForm" method="post"> 
                            	<input type="hidden" id="customerId" name="customerId" value="${sessionScope.loginVO.customerId }">
                            	</form>
                            	<form id="updatePasswordForm" action="/customer/updatePassword" method="post">
                            	<input type="hidden" id="customerId" name="customerId" value="${sessionScope.loginVO.customerId }">
                            	</form>
                            	<form id="orderCheckForm" action="/order/orderCheck" method="get">
                            	<input type="hidden" id="customerId" name="customerId" value="${sessionScope.loginVO.customerId}">
                            	</form>
                            	</div>
                            	${sessionScope.loginVO.customerName}님&nbsp;&nbsp;&nbsp;
                            	<a href="/customer/logout">logout</a>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="/"><img src="/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form"><%-- 상품 검색 --%>
                            <form action="/product/search" method="get" onsubmit="return checkKeyword()">
                            	<input type="hidden" id="option" name="option" value="">
                                <input type="text" id="keyword" name="keyword" placeholder="찾으시는 상품을 검색해 보세요!">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
	<!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories"><%-- 브랜드 카테고리 --%>
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>Brands</span>
                        </div>
                            <ul>
                            <c:forEach items="${allBrandList}" var="brand">
                            	<li><a href="/product/getProductListByBrand?brand=${brand.brand}&category=&option=">${brand.brand}</a></li>
                            </c:forEach>
                           </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <nav class="header__menu">
			            <ul>
			            <%-- <c:forEach items="${category}" var="category">
			            	<li><a href="categoryProduct?categoryName='${category.categoryName}'">${category.categoryName}</a></li>
			            </c:forEach> --%>
			            <c:forEach items="${categoryList }" var="c">
			                <li><a href="/category/categoryProduct?categoryName=${c.categoryName }&pageNo=0&option=">${c.categoryName }</a></li>
			            </c:forEach>
			            </ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function checkKeyword(){
		var keyword = document.getElementById("keyword").value;
		var option = document.getElementById("option").value;
		if(keyword == "") {
			alert("검색어를 입력하세요.");
			return false;
		} else {
			return true;
		}
	}
	$(function(){
		$("#updateInfo").click(function(){
			$("#customerInfoForm").submit();
		});
		$("#updatePassword").click(function(){
			$("#updatePasswordForm").submit();
		});
		$("#orderCheck").click(function(){
			$("#orderCheckForm").submit();
		})
	});
</script>
</body>
