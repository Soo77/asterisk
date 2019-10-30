package com.ast.eom.controller;

import java.io.File;
import java.sql.Date;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.ast.eom.dao.JoinDao;
import com.ast.eom.domain.Member;

@Controller
@RequestMapping("/join")
public class JoinController {

  @Autowired
  JoinDao joinDao;
  
  String uploadDir;
  
  public JoinController(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload");
  }
  
  @GetMapping("student")
  public void student() {
  }
  
  @GetMapping("parents")
  public void parents() {
  }
  
  @GetMapping("teacher")
  public void teacher() {
  }
  
  @GetMapping("form")
  public void form() {
  }
  
  @PostMapping("join")
  public String join(Member member, 
      MultipartFile filePath,
      int memberTypeNo,
      String birthyy,
      String birthmm,
      String birthdd,
      String mail) throws Exception {
    
    String emailAddress = member.getEmail() + "@" + mail;
    String dob = birthyy + "-" + birthmm + "-" + birthdd;
    Date testdob = Date.valueOf(dob);
    member.setEmail(emailAddress);
    member.setDateOfBirth(testdob);
    member.setMemberTypeNo(memberTypeNo);
    //멤버 타입 수정함 MemberType
    
    if (!filePath.isEmpty()) {
    String filename = UUID.randomUUID().toString();
    filePath.transferTo(new File(uploadDir + "/" + filename));
    member.setProfilePhoto(filename);
    }
    joinDao.insert(member);
    return "redirect:../auth/form";
  }
  
  @GetMapping("idCheck")
  @ResponseBody
  public int idCheck(String id) throws Exception {
    return joinDao.checkOverId(id);
  }
  
  @GetMapping("emailCheck")
  @ResponseBody
  public int emailCheck(String email) throws Exception {
    return joinDao.checkOverEmail(email);
  }
  
  @GetMapping("telCheck")
  @ResponseBody
  public int telCheck(String tel) throws Exception {
    return joinDao.checkOverTel(tel);
  }

}