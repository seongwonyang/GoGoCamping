<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<body>
		<div class="container">
			<div class="row h-100">
				<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
					<div class="hero__search">
                        <div class="#">
                        	<br><h3 style="font-weight: 700;">판매자 로그인</h3><br><br>
                        	<form action="SellerLogin" method="post">
								<input type="text" id="sellerId" name="sellerId" placeholder="  아이디" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
								<input type="password" id="hashSellerPassword" name="hashSellerPassword" placeholder="  비밀번호" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
								<input type="hidden" id="sellerPassword" name="sellerPassword">
								<button type="button" id="loginBtn" name="loginSeller" class="site-btn" style="width: 444px; height: 50px; background-color: #065E93; border-radius: 10px;">로그인</button><br>
                        		<span id="checkLogin" style="color: red">${text}</span><br>
								<a href="SellerRegisterForm"><button type="button" id="registerSellerBtn" name="registerSellerBtn" class="site-btn" style="width: 135px; height: 50px; background-color: #065E93; border-radius: 10px;">회원가입</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="findSellerIdForm"><button type="button" id="findIdBtn" name="findIdBtn" class="site-btn" style="width: 135px; height: 50px; background-color: #065E93; border-radius: 10px;">아이디 찾기</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="findSellerPwForm"><button type="button" id="findPwBtn" name="findPwBtn" class="site-btn" style="width: 135px; height: 50px; background-color: #065E93; border-radius: 10px;">비밀번호 찾기</button></a><br><br>
                        	</form>
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
         $("#loginBtn").click(function() {
			var sellerPw = CryptoJS.SHA256($('#hashSellerPassword').val()).toString();
			$("#sellerPassword").val(sellerPw);
            $.ajax({
               type:"post",
               url:"SellerLogin",
               data:"sellerId="+$("#sellerId").val()+"&sellerPassword="+$("#sellerPassword").val(),
               success:function(result){
                  if(result!="로그인성공"){
                     $("#checkLogin").text(result);
                  }
                  else{
                     $(location).attr('href','SellerHome')
                  }
               }
            });//ajax
         });//click
      });//ready
	  </script>
   </body>
</html>





