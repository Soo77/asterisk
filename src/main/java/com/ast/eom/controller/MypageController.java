package com.ast.eom.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ast.eom.domain.Member;
import com.ast.eom.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
  
  @Autowired
  private MypageService mypageService;
  
  @GetMapping("detail")
  public void detail(HttpSession session) throws Exception {
    Member loginUser = (Member) session.getAttribute("loginUser");
    Map<String, Object> memberInfoMap = mypageService.getMemberInfoMapBy(loginUser);
    
    for (String key : memberInfoMap.keySet()) {
      System.out.println(memberInfoMap.get(key));
    }
    
    session.setAttribute("memberInfoMap", memberInfoMap);
  }
}
