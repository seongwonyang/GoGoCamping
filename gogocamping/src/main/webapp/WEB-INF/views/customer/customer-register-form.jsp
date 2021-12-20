<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div class="container">
		<div class="row h-100">
			<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
				<div class="hero__search">
					<div style="">
						<br>
						<h3 style="font-weight: 700;">회원 가입 정보</h3><br><br>
						<form action="registerCustomer" method="post">
						<input type="text" name="customerId" id="customerId" placeholder="  아이디" required="required" style="width: 280px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;">
						<button type="button" class="site-btn" id="checkId" style="height: 50px; background-color: #245207; border-radius: 10px;">아이디중복확인</button><br>
						<span id="checkIdResult"></span><br>
						<input type="password" name="customerPassword" id="customerPassword" placeholder="  비밀번호" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;" onkeyup="passwordStrength()"><br>
						<span id="strengthPassword" ></span><br>
						<input type="password" name="customerPwck" id="customerPwck" placeholder="  비밀번호 확인" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;" onkeyup="checkPassword()"><br>
						<span id="checkPassword"></span><br>
						<input type="text" name="customerName" placeholder="  이름" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
						<input type="text" name="customerEmail" placeholder="  이메일" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br> 
						<input type="text" name="customerTel" placeholder="  전화번호 ex) 010-1234-5678" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
						<h5 style="font-weight: 700;">생년월일</h5><br> 
						<input type="date" name="customerBirth" placeholder="  생일" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
						<h5 style="font-weight: 700;">주소</h5><br> 
						<input type="text" id="customerPostNumber" name="customerPostNumber" placeholder="  우편번호" required="required" style="width: 322px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;">
						<button type="button" class="site-btn" id="address_kakao" style="height: 50px; background-color: #245207; border-radius: 10px; border-radius: 10px;">주소검색</button><br><br>
						<input type="text" id="customerAddress" name="customerAddress" placeholder="  주소" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
						<input type="text" id="customerDetailedAddress" name="customerDetailedAddress" placeholder="  상세주소" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
						<button type="submit" class="site-btn" id="hash" style="height: 50px; background-color: #245207; border-radius: 10px;">가입하기</button><br><br>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="<c:url value='js/core.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='js/sha256.min.js'/>"></script>
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
$(function() {
	$("#checkId").click(function(){
		$.ajax({
			type:"get",
			url:"checkId",
			data:"customerId="+$("#customerId").val(),
			success:function(result){
				$("#checkIdResult").text(result);
			}
		});//ajax
	});//click
	$("#hash").click(function(){
		var customerPassword = $("#customerPassword").val();
		var customerPwck = $("#customerPwck").val();
		if($("#checkIdResult").text() != "사용가능한 아이디입니다."){
			alert("아이디 중복확인 하세요.");
			return false;
		}
		if(customerPassword != customerPwck){
			alert("비밀번호를 확인하세요.");
			return false;
		}else{
			var customerPw = CryptoJS.SHA256($('#customerPassword').val()).toString(); 
			$('#customerPassword').val(customerPw);
		}
	});//click
});//ready
function checkPassword() {
	var customerPw = document.getElementById("customerPassword").value;
	var customerPwck = document.getElementById("customerPwck").value;
	if (customerPw == customerPwck) {
		document.getElementById("checkPassword").innerHTML = "비밀번호 일치"
		return true;
	} else {
		document.getElementById("checkPassword").innerHTML = "비밀번호 불일치"
		return false;
	}
}
function passwordStrength() {
	var strength = document.getElementById('strengthPassword');
	var strongRegex = new RegExp(
			"^(?=.{8,})(?=.*[a-zA-Z])(?=.*[0-9])(?=.*\\W).*$", "g");
	var mediumRegex = new RegExp(
			"^(?=.{8,})(((?=.*[a-zA-Z])(?=.*[0-9]))|((?=.*[a-zA-Z])(?=.*[0-9]))).*$",
			"g");
	var enoughRegex = new RegExp("(?=.{6,}).*", "g");
	var pwd = document.getElementById("customerPassword");
	if (pwd.value.length == 0) {
		strength.innerHTML = '비밀번호 강도체크';
	} else if (false == enoughRegex.test(pwd.value)) {
		strength.innerHTML = '비밀번호가 짧습니다.';
	} else if (strongRegex.test(pwd.value)) {
		strength.innerHTML = '<span style="color:green">강력</span>';
	} else if (mediumRegex.test(pwd.value)) {
		strength.innerHTML = '<span style="color:orange">중간</span>';
	} else {
		strength.innerHTML = '<span style="color:red">위험</span>';
	}
}
</script>
</body>
</html>





