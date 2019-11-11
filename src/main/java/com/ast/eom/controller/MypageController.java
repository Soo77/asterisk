package com.ast.eom.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ast.eom.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
  
  @Autowired
  private MypageService mypageService;
  
  @GetMapping("detail")
  public void detail(HttpSession session) throws Exception {
    Map<String, Object> memberInfoMap = mypageService.getMemberInfoMap();
    session.setAttribute("memberInfoMap", memberInfoMap);
  }
}
