package org.kosta.gogocamping.config.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginCheckInterceptor implements HandlerInterceptor {
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {

      HttpSession session = request.getSession(false);
      if (session != null && session.getAttribute("loginVO") != null) {
         return true;
      } else if(session != null && session.getAttribute("sellerVO") != null){
    	  return true;
      } else if(session != null && session.getAttribute("managerVO") != null){
    	  return true;
      }  else {
         // ajax request을 확인하기 위해
         String ajax = request.getHeader("x-requested-with");
         if (ajax != null && ajax.equals("XMLHttpRequest")) {
            response.sendError(401);
         } else {
            response.sendRedirect("/customer/loginForm");
         }
         System.out.println("**HandlerInterceptor 실행**" + request.getRequestURI() + " 비로그인상태에서 접근불가");
         return false;
      }
   }
}