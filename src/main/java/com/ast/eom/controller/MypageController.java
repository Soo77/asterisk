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
    // 로그인 페이지에서 합칠 경우 사라질 임시 코드들
    Member tempMember = mypageService.getTempMember(7);
    session.setAttribute("loginUser", tempMember);
    //
    
    Member memberInfo = (Member) session.getAttribute("loginUser");
    Map<String, Object> memberInfoMap = mypageService.getMemberInfoMapBy(memberInfo);
    
    session.setAttribute("memberInfoMap", memberInfoMap);
    
    String[] email = tempMember.getEmail().split("@");
    session.setAttribute("email", email);
  }
}
