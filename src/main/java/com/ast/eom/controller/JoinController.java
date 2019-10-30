package com.ast.eom.controller;

import java.io.File;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.ast.eom.domain.Member;
import com.ast.eom.service.JoinService;

@Controller
@RequestMapping("/join")
public class JoinController {

  @Autowired
  JoinService joinService;
  
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
  
  // 선생님 회원가입
  @PostMapping("teacherjoin")
  public String teacherjoin(Member member, 
      MultipartFile filePath,
      int memberTypeNo,
      String birthyy, String birthmm, String birthdd, 
      String mail, 
      String accountno, String bankname, String teacherintro, 
      MultipartFile lessoncertificate) 
          throws Exception {
    
    String emailAddress = member.getEmail() + "@" + mail;
    String dob = birthyy + "-" + birthmm + "-" + birthdd;
    Date testdob = Date.valueOf(dob);
    member.setEmail(emailAddress);
    member.setDateOfBirth(testdob);
    member.getMemberType().setMemberTypeNo(memberTypeNo);
    //멤버 타입 수정함 MemberType
    
    Map<String, Object> params = new HashMap<>();
    params.put("accountNo", accountno);
    params.put("bankName", bankname);
    params.put("teacherIntro", teacherintro);
    
    if (!lessoncertificate.isEmpty()) {
    String filename = UUID.randomUUID().toString();
    lessoncertificate.transferTo(new File(uploadDir + "/" + filename));
    params.put("lessonCertificate", filename);
    }
    
    if (!filePath.isEmpty()) {
      String filename = UUID.randomUUID().toString();
      filePath.transferTo(new File(uploadDir + "/" + filename));
      member.setProfilePhoto(filename);
    }
    
    joinService.teacherInsert(params);
    joinService.insert(member);
    return "redirect:../auth/form";
  }
  
  @GetMapping("idCheck")
  @ResponseBody
  public int idCheck(String id) throws Exception {
    return joinService.checkOverId(id);
  }
  
  @GetMapping("emailCheck")
  @ResponseBody
  public int emailCheck(String email) throws Exception {
    return joinService.checkOverEmail(email);
  }
  
  @GetMapping("telCheck")
  @ResponseBody
  public int telCheck(String tel) throws Exception {
    return joinService.checkOverTel(tel);
  }

}