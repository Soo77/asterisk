package com.ast.eom.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginCheckInterceptor implements HandlerInterceptor {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    
    if (request.getSession().getAttribute("loginUser") == null) {
      // 로그인 하지 않았다면 로그인 폼으로 보낸다.
      response.sendRedirect("/app/auth/form");
      return false;
    }
    
    // 다음 인터셉터나 페이지 컨트롤러를 계속 실행하고 싶다면 true를 리턴한다.
    // 여기서 요청 처리를 완료하고 싶다면 false를 리턴한다.
    return true; 
  }
}
