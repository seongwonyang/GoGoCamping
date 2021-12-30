<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<body>
		<div class="container">
			<div class="row h-100">
				<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
					<div class="hero__search">
                        <form method="post" action="SellerRegister" enctype="multipart/form-data">
                        	<br><h3 style="font-weight: 700;">판매자 가입 정보</h3><br><br>
							<input type="text" name="sellerId" id="sellerId" placeholder="  아이디" required="required" style="width: 300px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;">
							<button type="button" class="site-btn" id="checkId" style="height: 50px; background-color: #065E93; border-radius: 10px;">아이디 중복확인</button><br>
							<span id="checkIdResult" style="color: red"></span><br>
							<input type="password" id="sellerPassword" name="sellerPassword" placeholder="  비밀번호" required="required" style="width: 445px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;" onkeyup="passwordStrength()"><br>
							<span id="strengthPassword"></span><br>
							<input type="password" id="sellerPwck" name="sellerPwck" placeholder="  비밀번호 확인" required="required" style="width: 445px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;" onkeyup="checkPassword()"><br>
							<span id="checkPassword"></span><br>
							<input type="text" name="sellerName" placeholder="  이름" required="required" style="width: 445px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="email" name="sellerEmail" placeholder="  이메일" required="required" style="width: 445px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="text" name="sellerTel" placeholder="  전화번호" required="required" style="width: 445px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="text" name="businessNumber" placeholder="  사업자번호" required="required" style="width: 445px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="text" name="brand" placeholder="  브랜드명" required="required" style="width: 445px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<h5 style="font-weight: 700;">로고 사진 첨부</h5><br>
							<input type="file" id="logoImg" name="logoImg" placeholder="  로고 사진" required="required" style="font-weight: 700; width: 445px; padding: 10px 20px 10px; border: 2.5px solid #065E93; border-radius: 10px;" onchange="readURL(this)"><br>
							<span>이미지 미리보기</span><br>
							<img id="logoPreview" style="width: 445px; height: 200px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<h5 style="font-weight: 700;">사업장 주소</h5><br>
							<input type="text" id="sellerPostNumber" name="sellerPostNumber" placeholder="  우편번호" readonly="readonly" required="required" style="width: 336px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;">
							<button type="button" class="site-btn" id="address_kakao" style="height: 50px; background-color: #065E93; border-radius: 10px; border: 2.5px solid #065E93; border-radius: 10px;">주소 검색</button><br><br>
							<input type="text" id="sellerAddress" name="sellerAddress" placeholder="  주소" readonly="readonly" required="required" style="width: 445px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="text" id="sellerDetailedAddress" name="sellerDetailedAddress" placeholder="  상세주소" required="required" style="width: 445px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<button type="submit" class="site-btn" id="registerBtn" style="height: 50px; background-color: #065E93; border-radius: 10px;">가입 요청</button><br><br>
						</form>
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
			            	document.getElementById("sellerPostNumber").value = data.zonecode; //우편번호 넣기
			                document.getElementById("sellerAddress").value = data.address; // 주소 넣기
			                document.querySelector("input[name=sellerDetailedAddress]").focus(); //상세입력 포커싱
			            }
			        }).open();
			    });
			}
			$(function(){ // 아이디 중복체크
				$("#checkId").click(function(){
					$.ajax({
						type:"get",
						url:"findSellerById",
						data:"sellerId="+$("#sellerId").val(),
						success:function(result){
							$("#checkIdResult").text(result);
						} // success
					}); // ajax
				}); // click
				$("#registerBtn").click(function(){
					var sellerPassword = $("#sellerPassword").val();
					var sellerPwck = $("#sellerPwck").val();
					var sellerPw = CryptoJS.SHA256($('#sellerPassword').val()).toString();
					if($("#checkIdResult").text() != "사용 가능한 아이디입니다."){
						alert("아이디 중복확인 하세요.");
						return false;
					}else {
						if($("#checkPassword").text() != "비밀번호 일치"){
							alert("비밀번호를 확인하세요.");
							return false;
						}else{
							$('#sellerPassword').val(sellerPw);
						}
					}
				}); //click
			}); // ready
			function checkPassword() { // 비밀번호 확인
				var sellerPw = document.getElementById("sellerPassword").value;
				var sellerPwck = document.getElementById("sellerPwck").value;
				if (sellerPw == sellerPwck) {
					document.getElementById("checkPassword").innerHTML = "비밀번호 일치"
					return true;
				} else {
					document.getElementById("checkPassword").innerHTML = "비밀번호 불일치"
					return false;
				}
			}
			function passwordStrength() { // 비밀번호 강도체크
				var strength = document.getElementById('strengthPassword');
				var strongRegex = new RegExp(
						"^(?=.{8,})(?=.*[a-zA-Z])(?=.*[0-9])(?=.*\\W).*$", "g");
				var mediumRegex = new RegExp(
						"^(?=.{8,})(((?=.*[a-zA-Z])(?=.*[0-9]))|((?=.*[a-zA-Z])(?=.*[0-9]))).*$",
						"g");
				var enoughRegex = new RegExp("(?=.{6,}).*", "g");
				var pwd = document.getElementById("sellerPassword");
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
			/* function checkExt() {
				if (/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(document.getElementById("logoImg").value) == false) {
					alert("이미지 형식의 파일을 선택하십시오");
					document.getElementById("logoImg").value = "";
					readURL(input);
					return false;
				}
			} */
			function readURL(input) {
				if (input.files && input.files[0]) {
				    var reader = new FileReader();
				    reader.onload = function(e) {
				      document.getElementById('logoPreview').src = e.target.result;
				    };
				    reader.readAsDataURL(input.files[0]);
				  } else {
				    document.getElementById('logoPreview').src = "";
				}
			}
		</script>
	</body>
</html>






