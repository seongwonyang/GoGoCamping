<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<body>
	<div class="container">
		<div class="row h-100">
			<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
				<div class="hero__search">
					<div style="">
						<h3 style="font-weight: 700;">회원 정보 수정</h3><br><br>
						<form action="updateInfo" method="post">
						<input type="hidden" name="customerId" id="customerId" value="${customerInfo.customerId }" >
						<input type="text" name="customerName" id="customerName" placeholder="  이름" required="required" readonly="readonly" value="${customerInfo.customerName }" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
						<input type="text" name="customerEmail" id="customerEmail" placeholder="  이메일" required="required" value="${customerInfo.customerEmail }" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br> 
						<input type="text" name="customerTel" id="customerTel" placeholder="  전화번호 ex) 010-1234-5678" required="required" value="${customerInfo.customerTel }" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
						
						<h5 style="font-weight: 700;">주소</h5><br> 
						<input type="text" id="customerPostNumber" name="customerPostNumber" placeholder="  우편번호" required="required" readonly="readonly" value="${customerInfo.customerPostNumber }" style="width: 344px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;">
						<button type="button" class="site-btn" id="address_kakao" style="height: 50px; background-color: #245207; border-radius: 10px; border-radius: 10px;">주소검색</button><br><br>
						<input type="text" id="customerAddress" name="customerAddress" placeholder="  주소" required="required" readonly="readonly" value="${customerInfo.customerAddress }" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
						<input type="text" id="customerDetailedAddress" name="customerDetailedAddress" placeholder="  상세주소" required="required" value="${customerInfo.customerDetailedAddress }" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
						<button type="submit" class="site-btn" id="hash" style="height: 50px; background-color: #245207; border-radius: 10px;">변경하기</button><br><br>
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