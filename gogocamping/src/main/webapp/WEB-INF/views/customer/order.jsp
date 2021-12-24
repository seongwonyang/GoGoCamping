<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- <fmt:formatNumber value="${price}" pattern="#,###" /> -->
<body>
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/camp.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Order</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>주문서</h4>
                <form action="order" id="order" name="order" method="post">
                    <div class="row">
                        <div class="col-lg-7 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름<span>*</span></p>
                                        <input type="text" id="receiverName" name="receiverName" placeholder="수령인" required="required">
                                    </div>
                                </div>
                                <div class="col-lg-2"></div>
                                <div class="col-lg-4">
	                                <div class="checkout__input__checkbox">
                                        <input type="checkbox" id="same" name="same">&nbsp;&nbsp;주문자 정보와 동일
                                        <span class="checkmark"></span>
	                                </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <!-- <p>Last Name<span>*</span></p>
                                        <input type="text"> -->
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>전화번호<span>*</span></p>
                                <input type="text" id="receiverTel" name="receiverTel" placeholder="0000-0000-0000" required="required">
                            </div>
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <input type="text" id="orderPostNumber" name="orderPostNumber" placeholder="우편번호" class="checkout__input__add col-lg-6" required="required">
                                <button type="button" class="site-btn" id="address_kakao" style="height: 50px; background-color: #F2F2F2; border-radius: 10px; border-radius: 10px; color: #585858;">주소검색</button><br><br>
                                <input type="text" id="orderAddress" name="orderAddress" placeholder="주소" class="checkout__input__add" required="required">
                                <input type="text" id="orderDetailedAddress" name="orderDetailedAddress" placeholder="상세주소" required="required">
                            </div>
                            <div class="checkout__input">
                                <p>배송 시 요청사항</p>
                                <input type="text" id="orderComment" name="orderComment">
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-6">
                            <div class="checkout__order">
                                <h4>결제 정보</h4>
                                <div class="checkout__order__products">상품 정보 <span>결제 금액</span></div>
                                <ul>
                                <c:forEach items="${productList}" var="p">
                                	<li>${p.productVO.productName} (수량:${p.productCount}) <span><fmt:formatNumber value="${p.productVO.price * p.productCount}" pattern="#,###" /></span></li>
                                	<input type="hidden" id="kakaoProductName" name="kakaoProductName" value="${p.productVO.productName}">
                                	<input type="hidden" name="orderCount" value="${p.productCount}">
                                </c:forEach>
                                </ul>
                                <div class="checkout__order__subtotal">총 결제 금액 <span><fmt:formatNumber value="${totalPrice}" pattern="#,###" />원</span></div>
                                <input type="hidden" id="kakaoTotalPrice" name="kakaoTotalPrice" value="${totalPrice}">
                                <div class="checkout__input__checkbox">
                                     <input type="checkbox" id="agree" name="agree">&nbsp;&nbsp;개인정보 제 3자 제공 동의 (필수)
                                     <span class="checkmark"></span>
                                </div>
								    <div class="form-check-inline">
								      <label class="form-check-label" for="radio1">
								        <input type="radio" class="form-check-input" id="cash" name="payment" value="cash">무통장입금
								      </label>
								    </div>
								    <div class="form-check-inline">
								      <label class="form-check-label" for="radio2">
								        <input type="radio" class="form-check-input" id="card" name="payment" value="card">카드결제
								      </label><br>
								    </div>
								    <input type="hidden" name="checkList" value="${checkList}">
                                <button type="button" class="site-btn" onclick="payyy()">결제하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
function payyy(){
     // 폼 객체 접근
     var thisForm = document.order;

     // 결제 내용에 동의하십니까 내용.
     var order_check = thisForm.agree.checked;

     if (!order_check){
         alert('상위 주문 내용 확인에 동의해주세요.');
         return false;
     } 

     // 결제 방식 선택
     var payment_check = thisForm.elements["payment"].value; // 결제방식 라디오 버튼
     
     if($("input:radio[name='payment']").is(':checked') == false){
    	 alert("결제 방식을 선택해주세요.");
    	 return false; 	 
     }
     
     if (payment_check !== "card"){ // 카드 결제가 아니라면 오더 컨트롤러로 제출
         thisForm.submit();
     }; 

     //주문 상품의 총 가격 input[name='kakaoTotalPrice']
     total_price = '${totalPrice}';
     
     // 여러 종류를 주문할 때
     var order_name = $("input[name='kakaoProductName']").eq(0).attr("value");
     var count = $("input[name='kakaoProductName']").length;
     if (count > 1){
         order_name += ' 외 ' + (count-1) + '종';
     } 

     $(function(){
         var IMP = window.IMP;
         IMP.init('imp96816484');

        IMP.request_pay({
            pg : 'kakao',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : order_name,
            amount : total_price,
            buyer_email : '${sessionScope.loginVO.customerEmail}',
            buyer_name :  '${sessionScope.loginVO.customerName}',
            buyer_tel :  '${sessionScope.loginVO.customerTel}',
            buyer_addr :   thisForm.elements["orderAddress"].value + " " + thisForm.elements["orderDetailedAddress"].value,
            buyer_postcode :  thisForm.elements["orderPostNumber"].value,
            m_redirect_url : '/khx/payEnd.action'
        }, function(rsp) {
         if ( rsp.success ) { // 성공시
             var msg = '결제가 완료되었습니다.';
             msg += '고유ID : ' + rsp.imp_uid;
             msg += '상점 거래ID : ' + rsp.merchant_uid;
             msg += '결제 금액 : ' + rsp.paid_amount;
             msg += '카드 승인번호 : ' + rsp.apply_num;
             thisForm.submit();   

         } else { // 실패시
             var msg = '결제에 실패하였습니다.';
             msg += '에러내용 : ' + rsp.error_msg;r
             alert("실패");
         }
         });
     });    
 }

$(function(){
	$("#same").change(function() { // 주문자 정보와 동일
		var checked = $("input[name=same]:checked").length;

 		if(checked == 1) { 
 			$("#receiverName").val('${sessionScope.loginVO.customerName}');
 			$("#receiverTel").val('${sessionScope.loginVO.customerTel}');
 			$("#orderPostNumber").val('${sessionScope.loginVO.customerPostNumber}');
 			$("#orderAddress").val('${sessionScope.loginVO.customerAddress}');
 			$("#orderDetailedAddress").val('${sessionScope.loginVO.customerDetailedAddress}');
		} else {
			$("#receiverName").val('');
			$("#receiverTel").val('');
			$("#orderPostNumber").val('');
			$("#orderAddress").val('');
			$("#orderDetailedAddress").val('');
		}
	});//same
	
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	document.getElementById("orderPostNumber").value = data.zonecode; //우편번호 넣기
                document.getElementById("orderAddress").value = data.address; // 주소 넣기
                document.querySelector("input[name=orderDetailedAddress]").focus(); //상세입력 포커싱
            }
        }).open();
    });//address_kakao
});//ready
</script>
</body>
