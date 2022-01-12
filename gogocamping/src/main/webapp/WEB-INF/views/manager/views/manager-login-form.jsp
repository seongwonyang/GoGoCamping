<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
<!-- Breadcrumb Section Begin -->
  <div class="container">
     <div class="row h-100">
        <div class="col-lg-9 mx-auto text-center mt-7 mb-5">
           <div class="hero__search">
              <div class="#">
                 <br><h3 style="font-weight: 700;">관리자 로그인</h3><br><br>
                 <form method="post" action="/manager/login">
                 <input type="text" id="managerId" name="managerId" placeholder="  아이디" required="required" style="width: 444px; height: 50px; border: 2.5px solid #595959; border-radius: 10px;"><br><br>
                 <input type="password" id="password" name="password" placeholder="  비밀번호" required="required" style="width: 444px; height: 50px; border: 2.5px solid #595959; border-radius: 10px;"><br><br>
                 <input type="hidden" id="managerPassword" name="managerPassword">
                 <button type="button" name="loginBtn" id="loginBtn" class="site-btn" style="width: 444px; height: 50px; background-color: #595959; border-radius: 10px;">관리자 로그인</button><br><br>
                 <div id="checkLogin" style="font-style:bold; color:red"></div>
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
	$(function(){
	    $("#loginBtn").click(function() {
	       var managerPw = CryptoJS.SHA256($('#password').val()).toString();
           $("#managerPassword").val(managerPw);
	       $.ajax({
	          type:"post",
	          url:"/manager/login",
	          data:"managerId="+$("#managerId").val()+"&managerPassword="+$("#managerPassword").val(),
	          success:function(result){
	             if(result!="로그인성공"){
	                $("#checkLogin").text(result);
	             }
	             else{
	                $(location).attr('href','/manager/home')
	             }
	          }
	       });//ajax
	    });//click
	 });//ready
</script>
</body>
