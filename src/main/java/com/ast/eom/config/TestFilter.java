package com.ast.eom.config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestFilter implements Filter {
  
  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {

    HttpServletRequest httpReq = (HttpServletRequest) request;
    HttpServletResponse httpResp = (HttpServletResponse) response;
    
    String servletPath = httpReq.getServletPath();
    
        if (httpReq.getSession().getAttribute("loginUser") == null) {
          // 로그인 하지 않았다면 로그인 폼으로 보낸다.
          httpResp.sendRedirect("/app/auth/form");
          System.out.println("test2");
          return;
          
        }
      System.out.println("test");
    // 로그인 했다면 원래의 목적지로 보낸다.
    chain.doFilter(request, response);
  }

}
