package org.kosta.gogocamping.config.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component
public class HandlerInterceptorConfigure implements WebMvcConfigurer {
   private LoginCheckInterceptor interceptor;
   @Autowired
   public HandlerInterceptorConfigure(LoginCheckInterceptor interceptor) {
      super();
      this.interceptor = interceptor;
   }   
   
   @Override
   public void addInterceptors(InterceptorRegistry registry) {
      registry
      .addInterceptor(interceptor)
      .addPathPatterns("/**") // 모든 요청에 대해 LoginCheckInterceptor를 통해 로그인 여부를 확인하되 
      .excludePathPatterns("/",  "/css/**",  "/fonts/**",  "/img/**", "/image/**",  "/js/**",  "/sass/**", "/product/**", "/category/**", "/customer/**", 
    		  "/seller/home", "/seller/registerForm", "/seller/findSellerById", "/seller/register", "/seller/registerResultPage", "/seller/findSellerIdForm", "/seller/findSellerIdByBusinessNo", "/seller/findSellerPwForm",
    		  "/seller/findSellerPwByBusinessNo", "/seller/emailCode", "/seller/resetPasswordForm", "/seller/resetSellerPassword", "/seller/loginForm", "/seller/login", 
    		  "/manager/home", "/manager/loginForm", "/manager/login", "/callbackKaKao"); // 이 요청 경로들은 제외한다 
   }
}