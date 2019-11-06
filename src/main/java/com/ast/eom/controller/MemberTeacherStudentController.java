package com.ast.eom.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.ast.eom.dao.MemberTeacherStudentDao;
import com.ast.eom.domain.MemberTeacherStudent;

@Controller
@RequestMapping("/member")
public class MemberTeacherStudentController {
  
  @Autowired private MemberTeacherStudentDao memberTeacherStudentDao;
  
  @GetMapping("list")
  public void list(Model model, int memberTypeNo) throws Exception {
    List<MemberTeacherStudent> memberTeacherStudents = memberTeacherStudentDao.listTeacher(memberTypeNo);
    List<MemberTeacherStudent> memberTeacherStudents2 = memberTeacherStudentDao.listTeacher2();
    List<MemberTeacherStudent> memberStudents = memberTeacherStudentDao.listStudent(memberTypeNo);
    for (MemberTeacherStudent memberTeacherStudent : memberTeacherStudents) {
      System.out.println(memberTeacherStudent);
    }
    model.addAttribute("memberTeacherStudents", memberTeacherStudents);
    model.addAttribute("memberTeacherStudents2", memberTeacherStudents2);
    model.addAttribute("memberStudents", memberStudents);
    model.addAttribute("memberTypeNo", memberTypeNo);
  }
  
  @GetMapping("detail")
  public void detail(Model model, @RequestParam("no") int no) throws Exception {
    MemberTeacherStudent detailTeacher1 = memberTeacherStudentDao.detailTeacher(no);
    System.out.println("tttttttttt>>>>>>>"+detailTeacher1);
    model.addAttribute("detailTeacher", detailTeacher1);
  }
  
  
}
