<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
<div class="container">
         <div class="row h-100">
            <div class="col-lg-9 mx-auto text-center mt-7 mb-5">
               <div class="hero__search">
                 <div class="#">
                     <br><h3 style="font-weight: 700;">비밀번호 재설정</h3><br><br>
                     <form action="/customer/resetCustomerPassword" method="post">
                   		<input type="text" name="customerId" id="customerId" placeholder=" 아이디" value="${sessionScope.checkId.customerId}" readonly="readonly" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
                   		<input type="password" name="customerPassword" id="customerPassword" placeholder="  비밀번호" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;" onkeyup="passwordStrength()"><br>
						<span id="strengthPassword" ></span><br>
						<input type="password" name="customerPwck" id="customerPwck" placeholder="  비밀번호 확인" required="required" style="width: 445px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;" onkeyup="checkPassword()"><br>
						<span id="checkPassword"></span><br>
						<button type="submit" class="site-btn" id="resetPassword" style="width: 444px; height: 50px; background-color: #245207; border-radius: 10px;">비밀번호 변경</button>
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
$(function() {
	$("#resetPassword").click(function(){
		var customerPassword = $("#customerPassword").val();
		var customerPwck = $("#customerPwck").val();
		if(customerPassword != customerPwck){
			alert("비밀번호를 확인하세요.");
			return false;
		}else{
			var customerPw = CryptoJS.SHA256($('#customerPassword').val()).toString(); 
			$('#customerPassword').val(customerPw);
		}
	});//click
});//ready
</script>
</body>