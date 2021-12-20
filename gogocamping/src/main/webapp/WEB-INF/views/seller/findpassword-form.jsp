<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<body>
		<div class="container">
			<div class="row h-100">
				<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
					<div class="hero__search">
						<div class="#">
							<br><h3 style="font-weight: 700;">비밀번호 찾기</h3><br><br>
							<input type="text" id="sellerId" name="sellerId" placeholder="  아이디" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="text" id="sellerName" name="sellerName" placeholder="  이름" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="text" id="businessNumber" name="businessNumber" placeholder="  사업자 번호" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<button type="button" id="findPwBtn" class="site-btn" style="width: 444px; height: 50px; background-color: #065E93; border-radius: 10px;">비밀번호 찾기</button><br><br>
							<span id="findPwResult" style="color: red">${text}</span><br><br>
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
	   			$("#findPwBtn").click(function(){
	   				$.ajax({
	   	               type:"get",
	   	               url:"findSellerPwByBusinessNo",
	   	               data:"sellerId="+$("#sellerId").val()+"&sellerName="+$("#sellerName").val()+"&businessNumber="+$("#businessNumber").val(),
	   	               success:function(result){
	   	                  if(result=="회원 정보가 일치하지 않습니다.") {
	   	                     $("#findPwResult").text(result);
	   	                  }else {
	   	                	$("#result").text(result);
							$(location).attr('href','emailCode'); 	                  	 
	   	                  }
	   	               }
	   				});
	   			});
	   		});
	   	</script>
	</body>
</html>