package com.ast.eom.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ast.eom.dao.MemberDao;
import com.ast.eom.domain.Member;

@Controller
public class MemberController {
  
  @Autowired
  MemberDao memberDao;
  
  @RequestMapping("detail")
  public String detail(Model model, int no) throws Exception {
    
    Member member = memberDao.findBy(no);
    model.addAttribute("member", member);
    
    return "memdetail";
  }
  
  @RequestMapping("search")
  public String search(Model model) throws Exception {
    List<Member> members = memberDao.findAll();
    for (Member member : members) {
      System.out.println(member);
    }
    model.addAttribute("members", members);
    return "memsearch";
  }
}
