<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div class="container">
		<div class="row h-100">
			<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
				<div class="hero__search">
					<div style="">
						<br>
						<h3 style="font-weight: 700;">카카오 회원 가입</h3><br><br>
						<form action="/kakaoRegisterCustomer" method="post">
							<input type="hidden" name="customerId" id="customerId" value="${customerId}">
							<input type="text" name="customerName"  value="${name}" readonly="readonly" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
							<input type="text" name="customerEmail"  value="${email}" readonly="readonly" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br> 
							<input type="text" name="customerTel" placeholder="  ex:010-0000-0000" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
							<h5 style="font-weight: 700;">생년월일</h5><br> 
							<input type="date" name="customerBirth" placeholder="  생일" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
							<h5 style="font-weight: 700;">주소</h5><br> 
							<input type="text" id="customerPostNumber" name="customerPostNumber" placeholder="  우편번호" required="required" readonly="readonly" style="width: 344px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;">
							<button type="button" class="site-btn" id="address_kakao" style="height: 50px; background-color: #245207; border-radius: 10px; border-radius: 10px;">주소검색</button><br><br>
							<input type="text" id="customerAddress" name="customerAddress" placeholder="  주소" required="required" readonly="readonly" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
							<input type="text" id="customerDetailedAddress" name="customerDetailedAddress" placeholder="  상세주소" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
							<button type="submit" class="site-btn" style="height: 50px; background-color: #245207; border-radius: 10px;">가입하기</button><br><br>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript">
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	document.getElementById("customerPostNumber").value = data.zonecode; //우편번호 넣기
                document.getElementById("customerAddress").value = data.address; // 주소 넣기
                document.querySelector("input[name=customerDetailedAddress]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</body>