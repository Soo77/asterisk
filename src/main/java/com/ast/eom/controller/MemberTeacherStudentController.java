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

  @Autowired
  private MemberTeacherStudentService memberTeacherStudentService;

  @GetMapping("list")
  public void list(@RequestParam(defaultValue = "1") int pageNo,
                   @RequestParam(defaultValue = "3") int pageSize,
                   Model model, int memberTypeNo) throws Exception {
    // 총 페이지 개수 알아내기
    if (pageSize < 3 || pageSize > 20) {
      pageSize = 3;
    }
    int size = memberTeacherStudentService.size(memberTypeNo);
    int totalPage = size / pageSize;
    
    if (size % pageSize > 0) {
      totalPage++;
    }

    // 요청하는 페이지 번호가 유효하지 않을 때는 기본 값으로 1페이지로 지정한다.
    if (pageNo < 1 || pageNo > totalPage) {
      pageNo = 1;
    }

    List<MemberTeacherStudent> memberList = memberTeacherStudentService.list(memberTypeNo, pageNo, pageSize);
    
    System.out.println("Controller memberList>>>>>>>>" + memberTypeNo);
    System.out.println("Controller pageNo>>>>>>>>" + pageNo);
    System.out.println("Controller pageSize>>>>>>>>" + pageSize);
    System.out.println("Controller size>>>>>>>>" + size);
    
    model.addAttribute("memberList", memberList);
    model.addAttribute("memberTypeNo", memberTypeNo);

    model.addAttribute("pageNo", pageNo);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("size", size);
    model.addAttribute("beginPage", (pageNo - 2) > 0 ? (pageNo - 2) : 1);
    model.addAttribute("endPage", (pageNo + 2) < totalPage ? (pageNo + 2) : totalPage);



  }

  @GetMapping("detail")
  public void detail(Model model, @RequestParam("no") int no) throws Exception {
    List<MemberTeacherStudent> detailStudent = memberTeacherStudentService.get(no);
    List<MemberTeacherStudent> detailTeacher = memberTeacherStudentService.get2(no);
    
    model.addAttribute("detailStudent", detailStudent);
    model.addAttribute("detailTeacher", detailTeacher);
  }

  @GetMapping("ohora")
  @ResponseBody
  public Object ohora(int boardNo) {
    MemberTeacherStudent temp = new MemberTeacherStudent();
    temp.setName("홍길동");
    return temp;
  }
}
