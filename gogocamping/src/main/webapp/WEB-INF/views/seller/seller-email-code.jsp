<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div class="container">
         <div class="row h-100">
            <div class="col-lg-9 mx-auto text-center mt-7 mb-5">
               <div class="hero__search">
                        <div class="#">
                           <br><h3 style="font-weight: 700;">메일인증 코드 입력</h3><br><br>
                           <form action="#" method="post">
                        		<input type="text" id="confirmCode" name="confirmCode" required="required" placeholder="인증코드" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br>
                        		<input type="hidden" id="code" name="code" value="${sessionScope.authCode}">
                        		<span id="result"></span><br>
								<button type="button" class="site-btn" id="checkCode" style="width: 444px; height: 50px; background-color: #065E93; border-radius: 10px;">인증하기</button>
                           </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script src="http://code.jquery.com/jquery-latest.js"></script>
      <script type="text/javascript">
      	$(function(){
      		$("#checkCode").click(function(){
      		var confirmCode = $("#confirmCode").val();
      	    var code = $("#code").val();
      			if(confirmCode!=code){
      				$("#result").text("인증코드가 일치하지 않습니다.");
      			}else{
      				$(location).attr('href','resetPassword');
      			}
      		});//click
      	});//ready
      </script>
</body>