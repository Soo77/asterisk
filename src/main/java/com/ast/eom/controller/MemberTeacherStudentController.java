package com.ast.eom.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ast.eom.domain.MemberTeacherStudent;
import com.ast.eom.service.MemberTeacherStudentService;

@Controller
@RequestMapping("/member")
public class MemberTeacherStudentController {
  
  @Autowired private MemberTeacherStudentService memberTeacherStudentService;
  
  @GetMapping("list")
  public void list(Model model, int memberTypeNo) throws Exception {
    
    List<MemberTeacherStudent> memberList = memberTeacherStudentService.list(memberTypeNo);
    for (MemberTeacherStudent memberTeacherStudent : memberList) {
      System.out.println(memberTeacherStudent);
    }
    model.addAttribute("memberList", memberList);
    model.addAttribute("memberTypeNo", memberTypeNo);
  }
  
  @GetMapping("detail")
  public void detail(Model model, @RequestParam("no") int no) throws Exception {
    List<MemberTeacherStudent> detailTeacher1 = memberTeacherStudentService.get(no);
    model.addAttribute("detailTeacher1", detailTeacher1);
  }
  
  @GetMapping("ohora")
  @ResponseBody
  public Object ohora(int boardNo) {
    MemberTeacherStudent temp = new MemberTeacherStudent();
    temp.setName("홍길동");
    return temp;
  }
}
