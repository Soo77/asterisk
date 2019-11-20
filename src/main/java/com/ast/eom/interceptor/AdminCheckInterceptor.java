package com.ast.eom.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.ast.eom.domain.Member;

public class AdminCheckInterceptor implements HandlerInterceptor {

  @Override
  public boolean preHandle(
      HttpServletRequest request,
      HttpServletResponse response, Object handler)
      throws Exception {
    
    Member loginUser = (Member) request.getSession().getAttribute("loginUser");
    
    if (loginUser == null || loginUser.getMemberTypeNo() != 4) {
      response.sendRedirect("/app/auth/form");
      return false;
    }
    
    return true; 
  }
}
