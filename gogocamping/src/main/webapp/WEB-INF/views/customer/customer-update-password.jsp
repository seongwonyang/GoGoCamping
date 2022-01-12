<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div class="container">
		<div class="row h-100">
			<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
				<div class="hero__search">
					<div style="">
						<h3 style="font-weight: 700;">비밀번호 수정</h3><br><br>
						<form action="/customer/updateNewPassword" method="post" onsubmit="return checkpassword()">
						<input type="hidden" name="customerId" id="customerId" value="${sessionScope.loginVO.customerId }" >
						<input type="password" name="password" id="password" placeholder="  기존 비밀번호" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
						<input type="password" name="customerPassword" id="customerPassword" placeholder="  변경할 비밀번호" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;" onkeyup="passwordStrength()"><br>
						<span id="strengthPassword" ></span><br>
						<input type="password" name="customerPwck" id="customerPwck" placeholder="  비밀번호 확인" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;" onkeyup="checkPassword()"><br>
						<span id="checkPassword"></span><br>
						<button type="submit" class="site-btn" id="hash" style="height: 50px; background-color: #245207; border-radius: 10px;">변경하기</button><br><br>						
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="<c:url value='/js/core.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/sha256.min.js'/>"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript">
	$(function() {
		$("#hash").click(function(){
			var customerPassword = $("#customerPassword").val();
			var customerPwck = $("#customerPwck").val();
			if(customerPassword != customerPwck){
				alert("비밀번호를 확인하세요.");
				return false;
			}else{
				var customerPw = CryptoJS.SHA256($("#customerPassword").val()).toString(); 
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
	}r
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
	function checkpassword() {
		var password = CryptoJS.SHA256($("#password").val()).toString(); 
		if (password == "${sessionScope.loginVO.customerPassword}") {
			return true;
		} else {
			alert("기존 비밀번호가 일치하지 않습니다.");
			return false;
		}
	}
</script>
</body>
