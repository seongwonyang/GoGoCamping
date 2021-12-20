<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <body>
      <div class="container">
         <div class="row h-100">
            <div class="col-lg-9 mx-auto text-center mt-7 mb-5">
               <div class="hero__search">
                        <div class="#">
                           <br><h3 style="font-weight: 700;">로그인</h3><br><br>
                           <form action="#" method="post">
                        <input type="text" id="customerId" name="customerId" placeholder="  아이디"  style="width: 444px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
                        <input type="password" id="customerPassword" name="customerPassword" placeholder="  비밀번호"  style="width: 444px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
                        <span id="checkLogin"></span><br>
                        <button type="button" class="site-btn" id="loginCustomer" style="width: 444px; height: 50px; background-color: #245207; border-radius: 10px;">로그인</button><br><br>
                        <button type="button" class="site-btn" style="width: 134px; height: 50px; background-color: #245207; border-radius: 10px;" onclick="location.href='customer-find-id-form'">아이디 찾기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="site-btn" style="width: 148px; height: 50px; background-color: #245207; border-radius: 10px;">비밀번호 찾기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="site-btn" style="width: 128px; height: 50px; background-color: #245207; border-radius: 10px;">회원가입</button>
                           </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="<c:url value='js/core.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='js/sha256.min.js'/>"></script>
	<script type="text/javascript">
	
		$(function(){
			$("#loginCustomer").click(function() {
				var customerPw = CryptoJS.SHA256($('#customerPassword').val()).toString();
				$.ajax({
					type:"post",
					url:"loginCustomer",
					data:"customerId="+$("#customerId").val()+"&customerPassword="+customerPw,
					success:function(result){
						if(result!="로그인성공"){
							$("#checkLogin").text(result);
						}
						else{
							$(location).attr('href','/')
						}
					}
				});//ajax
			});//click
		});//ready
</script>
   </body>
</html>
