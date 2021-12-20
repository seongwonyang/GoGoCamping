<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
   <!--  <div class="humberger__menu__overlay"></div>
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
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
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
                                <li> </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__language">
                            	<div class="header__top__right__auth">
                                <c:choose>
	                        		<c:when test="${sessionScope.loginVO != null}">	                        			
	                           			${sessionScope.loginVO.sellerName} 님 환영합니다!
	                        		</c:when>
	                        		<c:otherwise>	                        		
	                           			<a href="SellerRegisterForm"><i class="fa fa-user" style="color: #1c1c1c; "></i> Register</a>
	                        		</c:otherwise>
	                        	</c:choose>
	                        	</div>
                            </div>
	                        <div class="header__top__right__auth">
	                        	<c:choose>
	                        		<c:when test="${sessionScope.loginVO != null}">	                        			
	                           			<a href="javascript:sellerLogout()"><i class="fa fa-user"></i>${sessionScope.loginVO.sellerId}</a>
	                        		</c:when>
	                        		<c:otherwise>	                        		
	                           			<a href="SellerLoginForm"><i class="fa fa-user"></i> Login</a>
	                        		</c:otherwise>
	                        	</c:choose>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="SellerHome"><img src="img/sellerLogo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-9" style="margin-top: 30px;">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="RegisterProductForm" style="color: #065E93">상품 등록</a></li>
                            <li><a href="QnAList" style="color: #065E93">고객 문의 관리</a></li>
                            <li><a href="./blog.html" style="color: #065E93">현재 주문 내역</a></li>
                            <li><a href="./contact.html" style="color: #065E93">전체 판매 내역</a></li>
                        </ul>
                    </nav>
                </div>
                <!-- <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div> -->
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
	<script type="text/javascript">
		function sellerLogout() {
			if(confirm("로그아웃 하시겠습니까?")==true) {
				location.href = "SellerLogout";
			}else {
				return false;
			}
		}
	</script>
</body>
