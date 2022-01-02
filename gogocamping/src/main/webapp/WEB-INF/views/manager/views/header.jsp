<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                           <div class="header__top__right__auth">
                            	<c:choose>
                           			<c:when test="${sessionScope.loginVO==null }">
                           				<a href="/manager/loginForm"><i class="fa fa-user"></i> Login</a>
                           			</c:when>
                           			<c:otherwise>
                           				<a id="logout" href="javascript:managerLogout()"><i class="fa fa-user"></i> 관리자 계정</a>
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
                        <a href="/manager/home"><img src="/img/managerLogo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-9" style="margin-top: 30px;">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="/manager/registerAdmin">가입 승인</a></li>
                            <li><a href="/manager/reviewManagement">고객 후기 관리</a></li>
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
	function managerLogout(){
		if(confirm("로그아웃 하시겠습니까?")==true){
			location.href="/manager/logout";
		}else{
			return false;
		}
	}
</script>

</body>