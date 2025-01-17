package com.ast.eom.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    List<MemberTeacherStudent> reviewTeacher = memberTeacherStudentService.review(no);
    List<MemberTeacherStudent> photoTeacher = memberTeacherStudentService.photo(no);
    List<MemberTeacherStudent> schoolTeacher = memberTeacherStudentService.school(no);
    
    for(int i=0; i < reviewTeacher.size(); i++) {
      model.addAttribute("review", reviewTeacher.get(i));
    }
    
    model.addAttribute("detailStudent", detailStudent);
    model.addAttribute("detailTeacher", detailTeacher);
    model.addAttribute("reviewTeacher", reviewTeacher);
    model.addAttribute("photoTeacher", photoTeacher);
    model.addAttribute("schoolTeacher", schoolTeacher);
  }
  
  @RequestMapping(value="search", method = {RequestMethod.GET})
  @ResponseBody
  public List<MemberTeacherStudent> search(HttpSession session, HttpServletRequest request, Model model) throws Exception {
    
    HashMap<String, Object> searchInfo = new HashMap<String, Object>();
    
    String memberTypeNo = request.getParameter("memberTypeNo");
    String mySido = request.getParameter("mySido");
    String myGugun = request.getParameter("myGugun");
    String myGender = request.getParameter("myGender");
    String myWantedFee = request.getParameter("myWantedFee");
    String mySchool = request.getParameter("mySchool");
    String mySubject = request.getParameter("mySubject");
    
    if (mySchool.equals("1")) {
      mySchool = "초";
    } else if (mySchool.equals("2")) {
      mySchool = "중";
      
    } else if (mySchool.equals("3")) {
      mySchool = "고";
      
    }
   
    searchInfo.put("memberTypeNo", memberTypeNo);
    searchInfo.put("mySido", mySido);
    searchInfo.put("myGugun", myGugun);
    searchInfo.put("myGender", myGender);
    searchInfo.put("myWantedFee", myWantedFee);
    searchInfo.put("mySchool", mySchool);
    searchInfo.put("mySubject", mySubject);
    
    for (Object s : searchInfo.keySet()) {
      System.out.println(searchInfo.get(s));
    }
    
    List<MemberTeacherStudent> resultList = memberTeacherStudentService.searchBy(searchInfo);
    
    return resultList;
  }
 
  
  
}
