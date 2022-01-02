<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/img/캠핑장.png">
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
       <div class="container">
         <div class="row h-100">
            <div class="col-lg-12 mx-auto text-center mt-7 mb-5">
               <div class="hero__search">
                  <div class="#">
                     <!-- Shoping Cart Section Begin -->
					    <section class="shoping-cart spad">
				        	<div class="section-title product__discount__title">
                         		<h3>미승인 판매자 목록</h3>
                   			</div>
					        <div class="container">
					            <div class="row">
					                <div class="col-lg-12">
					                    <div class="shoping__cart__table">
					                        <table>
					                            <thead>
					                                <tr>
					                                    <th style="padding-top: 20px;">판매자 ID</th>
					                                    <th style="padding-top: 20px;">이름</th>
					                                    <th style="padding-top: 20px;">브랜드</th>
					                                    <th style="padding-top: 20px;">사업자 번호</th>
					                                    <th style="padding-top: 20px;">연락처</th>
					                                    <th style="padding-top: 20px;"></th>
					                                </tr>
					                            </thead>
					                            <tbody>
					                            <c:forEach items="${sellerList }" var="seller">
						                                <tr>
						                                    <td class="shoping__cart__price">
						                                        ${seller.sellerId }
						                                    </td>
						                                    <td class="shoping__cart__price">
						                                        ${seller.sellerName }
						                                    </td>
						                                    <td class="shoping__cart__price">
						                                        ${seller.brand }
						                                    </td>
						                                    <td class="shoping__cart__price">
						                                        ${seller.businessNumber }123456789
						                                    </td>
						                                    <td class="shoping__cart__price">
						                                        ${seller.sellerTel }
						                                    </td>
						                                    <td class="shoping__cart__price">
						                                    	<button class="site-btn" type="button" onclick="adminSeller('${seller.sellerId}')" style="background-color: #595959; border-radius: 10px;">승인</button>
						                                    </td>
						                                </tr>
					                                </c:forEach>
					                            </tbody>
					                        </table>
					                    </div>
					                    <br><hr>
					                    
					                    <br><br>
										<div class="section-title product__discount__title">
                         					<h3>승인 판매자 목록</h3>
                   						</div>
										
					                    <div class="shoping__cart__table">
					                        <table>
					                            <thead>
					                                <tr>
					                                    <th style="padding-top: 20px;">판매자 ID</th>
					                                    <th style="padding-top: 20px;">이름</th>
					                                    <th style="padding-top: 20px;">브랜드</th>
					                                    <th style="padding-top: 20px;">사업자 번호</th>
					                                    <th style="padding-top: 20px;">연락처</th>
					                                    <th style="padding-top: 20px;"></th>
					                                </tr>
					                            </thead>
					                            <tbody>
					                            <c:forEach items="${adminSellerList }" var="seller">
						                                <tr>
						                                    <td class="shoping__cart__price">
						                                        ${seller.sellerId }
						                                    </td>
						                                    <td class="shoping__cart__price">
						                                        ${seller.sellerName }
						                                    </td>
						                                    <td class="shoping__cart__price">
						                                        ${seller.brand }
						                                    </td>
						                                    <td class="shoping__cart__price">
						                                        ${seller.businessNumber }
						                                    </td>
						                                    <td class="shoping__cart__price">
						                                        ${seller.sellerTel }
						                                    </td>
						                                    <td class="shoping__cart__price">
						                                    	승인 완료
						                                    </td>
						                                </tr>
					                                </c:forEach>
					                            </tbody>
					                        </table>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </section>
					    <!-- Shoping Cart Section End -->
					    
                  </div>
               </div>
            </div>
         </div>
      </div>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function adminSeller(sellerId){
		if(confirm("해당 판매자의 가입을 승인하시겠습니까?")==true){
			location.href="/manager/adminSeller?sellerId="+sellerId;
		}else{
			return false;
		}
	}
</script>
</body>
