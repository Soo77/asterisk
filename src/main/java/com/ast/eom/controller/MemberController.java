package com.ast.eom.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
  
  @GetMapping("list2")
  public void list(Model model,HttpSession session) throws Exception {
//    List<Member> members = memberDao.listMember();
//    for (Member member : members) {
//      System.out.println(member);
//    }
//    model.addAttribute("members", members);
  }
  /*
   * @GetMapping("detail") public void detail(HttpSession session, Model model, int no) throws
   * Exception { Member member = memberDao.detailMember(no); model.addAttribute("member", member); }
   */
  
  
}
