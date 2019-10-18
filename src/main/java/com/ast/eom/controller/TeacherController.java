package com.ast.eom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ast.eom.dao.MemberDao;
import com.ast.eom.domain.Teacher;

@Controller
public class TeacherController {
  
  @Autowired
  MemberDao memberDao;
  
  public String detail(Model model, int no) throws Exception {
    
    Teacher teacher = memberDao.findBy2(no);
    model.addAttribute("Teacher", teacher);
    
    return "memdetail";
  }
  
//  public String search(Model model) throws Exception {
//    List<Member> members = memberDao.findAll();
//    for (Member member : members) {
//      System.out.println(member);
//    }
//    model.addAttribute("members", members);
//    return "memsearch";
//  }
}
