package com.ast.eom.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ast.eom.dao.MemberTeacherStudentDao;
import com.ast.eom.domain.MemberTeacherStudent;

@Controller
@RequestMapping("/member")
public class MemberTeacherStudentController {
  
  @Autowired private MemberTeacherStudentDao memberTeacherStudentDao;
  
  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<MemberTeacherStudent> memberTeacherStudents = memberTeacherStudentDao.listMember();
    List<MemberTeacherStudent> memberTeacherStudents2 = memberTeacherStudentDao.listMember2();
    for (MemberTeacherStudent memberTeacherStudent : memberTeacherStudents) {
      System.out.println(memberTeacherStudent);
    }
    model.addAttribute("memberTeacherStudents", memberTeacherStudents);
    model.addAttribute("memberTeacherStudents2", memberTeacherStudents2);
  }
  
//  @GetMapping("detail")
//  public void detail(HttpSession session, Model model, int no) throws Exception {
//    Member member = memberDao.detailMember(no);
//    model.addAttribute("member", member);
//  }
  
  
}
