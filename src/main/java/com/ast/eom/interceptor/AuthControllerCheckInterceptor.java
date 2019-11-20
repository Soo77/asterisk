package com.ast.eom.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthControllerCheckInterceptor implements HandlerInterceptor {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    
    if (request.getSession().getAttribute("loginUser") != null) {
      response.sendRedirect("/app/mypage/detail");
      return false;
    }
    
    return true; 
  }
}
