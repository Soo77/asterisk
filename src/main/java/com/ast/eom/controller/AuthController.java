package com.ast.eom.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ast.eom.dao.AuthDao;
import com.ast.eom.domain.Member;

@Controller
@RequestMapping("/auth")
public class AuthController {

  @Autowired
  private AuthDao authDao;

  @GetMapping("form")
  public void form() {
  }

  @GetMapping("loginsuccess")
  public void loginsuccess() {
  }

  @GetMapping("loginfail")
  public void loginfail() {
  }

  @PostMapping("login")
  public String login(HttpSession session, String id, String pw) 
          throws Exception {

    Map<String, String> params = new HashMap<>();
    params.put("id", id);
    params.put("pw", pw);

    Member member = authDao.login(params);

    if (member == null) {
      return "redirect:../auth/loginfail";
    }
    session.setAttribute("loginUser", member);
    return "redirect:../auth/loginsuccess";
  }

  @GetMapping("logout")
  public String logout(HttpSession session) 
      throws Exception {
    session.invalidate();
    return "redirect:form";
  }

  // 아이디 찾기
  @PostMapping("findid")
  public String findid(HttpSession session, String mail0, String mail1,
      String name) throws Exception {
    String email = mail0+"@"+mail1;

    Member member = new Member();
    member.setEmail(email);
    member.setName(name);

    if(authDao.findId(member) != null) {
      session.setAttribute("findId", authDao.findId(member));
      return "redirect:../auth/findidcheck";
    } else {
      session.setAttribute("findId", authDao.findId(member));
      return "redirect:../auth/findidcheck";
    }
  }

  //비밀번호 찾기, 변경
  @PostMapping("pwchange")
  public String findpw(String newpwok) throws Exception {
    String email = "test99@naver.com";
    Member member = new Member();
    member.setPassword(newpwok);
    member.setEmail(email);
    
    authDao.pwChange(member);
    return "redirect:../auth/form";
  }

  // 아이디 찾기페이지
  @GetMapping("find")
  public void find() throws Exception {
  }

  // 비밀번호 변경페이지
  @GetMapping("findpw")
  public void findpw() throws Exception {
  }

  // 아이디 기억페이지
  @GetMapping("findidcheck")
  public void findidcheck() throws Exception {
  }

}
