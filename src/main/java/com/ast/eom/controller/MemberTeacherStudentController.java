package com.ast.eom.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ast.eom.domain.MemberTeacherStudent;
import com.ast.eom.domain.Pagination;
import com.ast.eom.service.MemberTeacherStudentService;

@Controller
@RequestMapping("/member")
public class MemberTeacherStudentController {

  @Autowired
  private MemberTeacherStudentService memberTeacherStudentService;

  @GetMapping("list")
  public void list(
      Model model, 
      int memberTypeNo,
      @RequestParam(defaultValue = "20") int pageSize,
      @RequestParam(defaultValue = "1") int curPage
      ) throws Exception {
    
    List<MemberTeacherStudent> memberList = null;
    
    if (memberTypeNo == 1) { 
      memberList = memberTeacherStudentService.list2(memberTypeNo); 
    } else if (memberTypeNo == 3) { 
      memberList = memberTeacherStudentService.list(memberTypeNo);
    }
    
    int listCnt = memberList.size();
    Pagination pagination = new Pagination(listCnt, curPage, pageSize);
    
    model.addAttribute("memberList", memberList);
    model.addAttribute("memberTypeNo", memberTypeNo);
    model.addAttribute("listCnt", listCnt);
    model.addAttribute("pagination", pagination);
    model.addAttribute("pageSize", pageSize);
  }

  @GetMapping("detail")
  public void detail(Model model, @RequestParam("no") int no) throws Exception {
    List<MemberTeacherStudent> detailStudent = memberTeacherStudentService.get(no);
    List<MemberTeacherStudent> detailTeacher = memberTeacherStudentService.get2(no);
    
    model.addAttribute("detailStudent", detailStudent);
    model.addAttribute("detailTeacher", detailTeacher);
  }
  
  @RequestMapping("search")
  public String search(HttpServletRequest request, Model model) throws Exception {
    
    String sido1 = "";
    String gugun1 = "";
    String gender = "";
    String age = "";
    String wantedFee = "";
    String school1 = "";
    String subject1 = "";
    
    sido1 = request.getParameter("sido1");
    gugun1 = request.getParameter("gugun1");
    gender = request.getParameter("gender");
    age = request.getParameter("age");
    wantedFee = request.getParameter("wantedFee");
    school1 = request.getParameter("school1");
    subject1 = request.getParameter("subject1");
    
   
    
    return "";
  }
 
  
  
  /*
   * @GetMapping("ohora")
   * 
   * @ResponseBody public Object ohora(int boardNo) { MemberTeacherStudent temp = new
   * MemberTeacherStudent(); temp.setName("홍길동"); return temp; }
   */
}
