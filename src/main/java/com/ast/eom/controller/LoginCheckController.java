package com.ast.eom.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ast.eom.domain.Member;

@Controller
@RequestMapping
public class LoginCheckController {
  
  @GetMapping("loginCheck")
  @ResponseBody
  public Object loginCheck(HttpSession session) {
    Member loginUser = (Member) session.getAttribute("loginUser");
    Map<String, Object> loginCheck = new HashMap<>();
    if (loginUser != null) {
      loginCheck.put("signIn", true);
      loginCheck.put("loginUserName", loginUser.getName());
    } else {
      loginCheck.put("signIn", false);
    }
    return loginCheck;
  }
  
}
