package com.ast.eom.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
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
    
    /*
     * List<MemberTeacherStudent> memberList = memberTeacherStudentService.list(memberTypeNo);
     * List<MemberTeacherStudent> memberList2 = memberTeacherStudentService.list2(memberTypeNo);
     */
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
  
  /*
   * @GetMapping("ohora")
   * 
   * @ResponseBody public Object ohora(int boardNo) { MemberTeacherStudent temp = new
   * MemberTeacherStudent(); temp.setName("홍길동"); return temp; }
   */
}
