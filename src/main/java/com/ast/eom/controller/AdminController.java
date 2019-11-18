package com.ast.eom.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
  
  @ResponseBody
  @GetMapping("getMemberInfo")
  public Object getMemberInfo(int memberTypeNo) throws Exception {
    return adminService.loadMemberInfoMapOf(memberTypeNo);
  }
}
