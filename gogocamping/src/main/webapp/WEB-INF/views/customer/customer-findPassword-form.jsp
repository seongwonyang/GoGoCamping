<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div class="container">
         <div class="row h-100">
            <div class="col-lg-9 mx-auto text-center mt-7 mb-5">
               <div class="hero__search">
                        <div class="#">
                           <br><h3 style="font-weight: 700;">비밀번호 찾기</h3><br><br>
                           <form action="#" method="post">
                        <input type="text" id="customerId" name="customerId" placeholder="  아이디"  style="width: 444px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
                        <input type="text" id="customerEmail" name="customerEmail" placeholder="  이메일"  style="width: 444px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br>
                        <span id="result"></span><br>
                        <button type="button" class="site-btn" id="findPassword" style="width: 222px; height: 50px; background-color: #245207; border-radius: 10px;">비밀번호 찾기</button>
                        <button type="button" class="site-btn" onclick="location.href='/customer/loginForm'" style="width: 222px; height: 50px; background-color: #245207; border-radius: 10px;">로그인 하기</button>
                        <br><br>
                           </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script src="http://code.jquery.com/jquery-latest.js"></script> 
      <script type="text/javascript">
		$(function(){
			$("#findPassword").click(function(){
				$.ajax({
					type : "get",
					url : "/customer/findPassword",
					data : "customerId="+$("#customerId").val()+"&customerEmail="+$("#customerEmail").val(),
					success : function(result) {
						if(result=="아이디 또는 이메일이 일치하지않습니다."){
							$("#result").text(result);
						}else{
							$("#result").text(result);
							$(location).attr('href','/customer/emailCode');
						}
					}
				});//ajax
			});//click
		})//ready
</script>
</body>