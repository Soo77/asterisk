package com.ast.eom.controller;

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
  
  @ResponseBody
  @GetMapping("getMemberInfo")
  public Object getMemberInfo(int memberTypeNo) throws Exception {
    return adminService.loadMemberInfoMapOf(memberTypeNo);
  }
}
