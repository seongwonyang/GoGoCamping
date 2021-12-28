<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
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
 <hr>
   <body>
      <div class="container">
         <div class="row h-100">
            <div class="col-lg-9 mx-auto text-center mt-7 mb-5">
               <div class="hero__search">
                   	<h4>네이버 아이디로 가입 완료</h4><br><br>
                   	<h5>버튼을 클릭하여 로그인하여 주시기 바랍니다.</h5><br><br>
                 	 <a href="<%=apiURL%>"><img height="50" src="img/btnG_완성형.PNG"/></a><br><br><br><br>
                 	 <img src="img/네이버-가입.png" alt="">
               </div>
            </div>
         </div>
      </div>
   </body>
</html>
