<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%-- 네이버 로그인 --%>
<%
    String clientId = "sKPixzJ1zQsrjGzTzog0";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:7777/callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
   <body>
      <div class="container">
         <div class="row h-100">
            <div class="col-lg-9 mx-auto text-center mt-7 mb-5">
               <div class="hero__search">
                        <div class="#">
                           <h3 style="font-weight: 700;">로그인</h3><br><br>
                           <form action="#" method="post">
                        <input type="text" id="customerId" name="customerId" placeholder="  아이디"  style="width: 444px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
                        <input type="password" id="customerPassword" name="customerPassword" placeholder="  비밀번호"  style="width: 444px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br>
                        <span id="checkLogin"></span><br>
                        <button type="button" class="site-btn" id="loginCustomer" style="width: 444px; height: 50px; background-color: #245207; border-radius: 10px;">로그인</button><br><br>
                        <button type="button" class="site-btn" style="width: 134px; height: 50px; background-color: #245207; border-radius: 10px;" onclick="location.href='customer-find-id-form'">아이디 찾기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="site-btn" style="width: 148px; height: 50px; background-color: #245207; border-radius: 10px;" onclick="location.href='customer-findPassword-form'">비밀번호 찾기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="site-btn" style="width: 128px; height: 50px; background-color: #245207; border-radius: 10px;" onclick="location.href='registerCustomerForm'">회원가입</button>
                           </form>
                  </div>
               </div>
               <br>
               <a href="<%=apiURL%>"><img height="50" src="img/btnG_완성형.PNG"/></a><br><br>
               <form action="callbackKaKao" id="callbackKaKao" method="post">
         		<div id="kakaologin">
					<div class="kakaobtn">
						<input type="hidden" name="kakaoId" id="kakaoId" value=""/>
						<input type="hidden" name="kakaoEmail" id="kakaoEmail" value=""/>
						<input type="hidden" name="kakaoName" id="kakaoName" value=""/>
						<a href="javascript:kakaoLogin();"> <img src="img/kakao_login_medium_narrow.png" /></a>
					</div>
			  </div>
			  </form>
			  <!-- <form action="callbackKaKao" method="post" name="lfrm" hidden>
    				<input type="text" name="kakaoemail" id="kakaoemail" value="" />
    			</form> -->
            </div>
         </div>
      </div>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="<c:url value='js/core.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='js/sha256.min.js'/>"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
		
		//카카오 로그인 시작시점
		window.Kakao.init("1b1a8cddc6c5a14dfed5268de34d0861");
		function kakaoLogin(){
			window.Kakao.Auth.login({
				scope:'profile_nickname,account_email',
				success: function(authObj){
					//console.log(authObj);
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
</html>
