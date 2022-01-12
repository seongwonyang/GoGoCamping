<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

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
	                        		<c:when test="${sessionScope.sellerVO != null}">	                        			
	                           			${sessionScope.sellerVO.sellerName} 님 환영합니다!
	                        		</c:when>
	                        		<c:otherwise>	                        		
	                        			<a href="/seller/loginForm"><i class="fa fa-user"></i> Login</a>
	                        		</c:otherwise>
	                        	</c:choose>
	                        	</div>
                            </div>
	                        <div class="header__top__right__auth">
	                        	<c:choose>
	                        		<c:when test="${sessionScope.sellerVO != null}">	                        			
	                           			<a href="javascript:sellerLogout()"><i class="fa fa-user"></i> 로그아웃</a>
	                        		</c:when>
	                        		<c:otherwise>	                        		
	                           			<a href="/seller/registerForm"><i class="fa fa-user" style="color: #1c1c1c; "></i> Register</a>
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
                        <a href="/seller/home"><img src="/img/sellerLogo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-9" style="margin-top: 30px;">
                    <nav class="header__menu">
                        <ul>
                        	<c:choose>
	                        	<c:when test="${sessionScope.sellerVO != null}">
		                            <li><a href="/seller/registerProductForm" style="color: #065E93">상품 등록</a></li>
		                            <li><a href="/seller/QnAList" style="color: #065E93">고객 문의 관리</a></li>
		                            <li><a href="/seller/orderList" style="color: #065E93">현재 주문 내역</a></li>
		                            <li><a href="/seller/totalSoldList" style="color: #065E93">전체 판매 내역</a></li>
		                        </c:when>
		                        <c:otherwise>
		                        	<li><a href="#" style="color: #065E93">상품 등록</a></li>
		                            <li><a href="#" style="color: #065E93">고객 문의 관리</a></li>
		                            <li><a href="#" style="color: #065E93">현재 주문 내역</a></li>
		                            <li><a href="#" style="color: #065E93">전체 판매 내역</a></li>
		                        </c:otherwise>
	                        </c:choose>
                        </ul>
                    </nav>
                </div>
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
				location.href = "/seller/logout";
			}else {
				return false;
			}
		}
	</script>
</body>
