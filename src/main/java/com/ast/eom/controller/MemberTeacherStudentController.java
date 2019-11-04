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
    List<MemberTeacherStudent> memberTeacherStudents = memberTeacherStudentDao.listTeacher();
    List<MemberTeacherStudent> memberTeacherStudents2 = memberTeacherStudentDao.listTeacher2();
    List<MemberTeacherStudent> memberStudents = memberTeacherStudentDao.listStudent();
    for (MemberTeacherStudent memberTeacherStudent : memberTeacherStudents) {
      System.out.println(memberTeacherStudent);
    }
    model.addAttribute("memberTeacherStudents", memberTeacherStudents);
    model.addAttribute("memberTeacherStudents2", memberTeacherStudents2);
    model.addAttribute("memberStudents", memberStudents);
  }
  
  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    MemberTeacherStudent detailTeacher = memberTeacherStudentDao.detailTeacher(no);
    model.addAttribute("detailTeacher", detailTeacher);
  }
  
  
}
