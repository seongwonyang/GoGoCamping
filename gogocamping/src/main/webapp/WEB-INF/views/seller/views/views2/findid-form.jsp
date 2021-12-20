<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<body>
		<div class="container">
			<div class="row h-100">
				<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
					<div class="hero__search">
						<div class="#">
							<br><h3 style="font-weight: 700;">아이디 찾기</h3><br><br>
							<input type="text" id="sellerName" name="sellerName" placeholder="  이름" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="text" id="businessNumber" name="businessNumber" placeholder="  사업자 번호" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<button type="button" id="findIdBtn" class="site-btn" style="width: 444px; height: 50px; background-color: #065E93; border-radius: 10px;">아이디 찾기</button><br><br>
							<span id="findIdResult" style="color: red">${text}</span><br><br>
							<a href="findSellerPwForm" id="findPwLink" style="color: #065E93">${text}</a><br><br>							
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="<c:url value='js/core.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='js/sha256.min.js'/>"></script>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
	   	<script type="text/javascript">
	   		$(function(){
	   			$("#findIdBtn").click(function(){
	   				$.ajax({
	   	               type:"get",
	   	               url:"findSellerIdByBusinessNo",
	   	               data:"sellerName="+$("#sellerName").val()+"&businessNumber="+$("#businessNumber").val(),
	   	               success:function(result){
	   	                  if(result=="") {
	   	                     $("#findIdResult").text("입력하신 정보가 올바르지 않습니다.");
	   	                  }else {
	   	                     $("#findIdResult").text("판매자님의 아이디는 " + result + " 입니다.");	   	                  	 
	   	                     $("#findPwLink").text("비밀번호도 알고 싶어요.");	   	                  	 
	   	                  }
	   	               }
	   				});
	   			});
	   		});
	   	</script>
	</body>
</html>
