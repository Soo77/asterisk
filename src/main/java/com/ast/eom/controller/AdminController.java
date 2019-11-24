package com.ast.eom.controller;

import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ast.eom.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
  
  @Autowired
  AdminService adminService;
  
  @GetMapping("list")
  public void list() {}
  
  @GetMapping("detail")
  public void detail(
      HttpSession session,
      int memberNo,
      int memberTypeNo) throws Exception {
    
    Map<String, Object> memberInfoMapForDetail =
        adminService.getInfoMap(memberNo, memberTypeNo);
    session.setAttribute("memberInfoMapForDetail", memberInfoMapForDetail);
  }
  
  @GetMapping("interruptionDetail")
  public void interruptionDetail(
      Model model,
      HttpSession session,
      int lessonNo) throws Exception {
    
    Map<String, Object> pendingLessonsInfoMapDetail =
        adminService.getPendingLessonsInfoMap(lessonNo);
    session.setAttribute("pendingLessonsInfoMapDetail", pendingLessonsInfoMapDetail);
  }

  @ResponseBody
  @PostMapping("approveIntteruption")
  public void approveIntteruption(
      int lessonNo) throws Exception {
    adminService.approveInterruption(lessonNo);
  }
  
  @ResponseBody
  @GetMapping("getMemberInfo")
  public Object getMemberInfo(
      int memberTypeNo,
      @RequestParam(defaultValue = "20") int pageSize,
      @RequestParam(defaultValue = "1") int curPage) throws Exception {
    return adminService.loadMemberInfoMapOf(memberTypeNo,
        pageSize, curPage);
  }
  
  @ResponseBody
  @GetMapping("getPendingLessons")
  public Object getPendingLessons() throws Exception {
    return adminService.getPendingLessons();
  }
  
  @ResponseBody
  @PostMapping("approveTeacherCerti")
  public void approveTeacherCerti(
      int teacherNo) throws Exception {
    adminService.approve(teacherNo);
  }

  @ResponseBody
  @PostMapping("acceptThisMember")
  public void acceptThisMember(
      int memberNo) throws Exception {
    adminService.accept(memberNo);
  }
  
  @ResponseBody
  @PostMapping("rejectThisMember")
  public void rejectThisMember(
      int memberNo) throws Exception {
    adminService.reject(memberNo);
  }
  
}
