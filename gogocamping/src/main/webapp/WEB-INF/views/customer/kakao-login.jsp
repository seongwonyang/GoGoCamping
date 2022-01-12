<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<hr>
<body>
    <div class="container">
       <div class="row h-100">
          <div class="col-lg-9 mx-auto text-center mt-7 mb-5">
             <div class="hero__search">
                	<h4>카카오 아이디로 가입 완료</h4><br><br>
                	<h5>버튼을 클릭하여 로그인하여 주시기 바랍니다.</h5><br><br>
                 	<form action="/callbackKaKao" id="callbackKaKao" method="post">
		         		 <div id="kakaologin">
							<div class="kakaobtn">
								<input type="hidden" name="kakaoId" id="kakaoId" value=""/>
								<input type="hidden" name="kakaoEmail" id="kakaoEmail" value=""/>
								<input type="hidden" name="kakaoName" id="kakaoName" value=""/>
								<a href="javascript:kakaoLogin();"> <img src="/img/kakao_login_medium_narrow.png" /></a>
							</div>
					 	 </div>
			  		</form>
               <br><img src="/img/카카오가입.png" alt="">
             </div>
          </div>
       </div>
    </div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
//카카오 로그인 시작시점
window.Kakao.init("1b1a8cddc6c5a14dfed5268de34d0861");
function kakaoLogin(){
	window.Kakao.Auth.login({
		scope:'profile_nickname,account_email',
		success: function(authObj){
			window.Kakao.API.request({
				url: '/v2/user/me',
			    data: {
			        property_keys: ["kakao_account.email","properties.nickname"]
			    },
			    success: function(response) {
			    	$("#kakaoId").val(response.id);
			        $("#kakaoEmail").val(response.kakao_account.email);
			        $("#kakaoName").val(response.properties.nickname);
			        $("#callbackKaKao").submit();
			    },
			    fail: function(error) {
			        console.log(error);
			    }
			});
		}
	});
}
</script>
</body>
