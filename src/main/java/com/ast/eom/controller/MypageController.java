package com.ast.eom.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ast.eom.domain.LessonSubject;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Parents;
import com.ast.eom.domain.Student;
import com.ast.eom.domain.Teacher;
import com.ast.eom.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
  
  @Autowired
  MypagePhotoWriter photoWriter;

  @Autowired
  private MypageService mypageService;
  
  @GetMapping("detail")
  public void detail(HttpSession session) throws Exception {
    Map<String, Object> memberInfoMap = mypageService.getMemberInfoMap();
    session.setAttribute("memberInfoMap", memberInfoMap);
  }
  
  @PostMapping("update")
  public String update(
      HttpSession session,
      Member member,
      Student student,
      Teacher teacher,
      String[] schoolTypeNo,
      String[] subjectNo,
      String[] wantedFee,
      String[] lessonDay,
      Parents parents,
      String[] teacherPhotoNames,
      MultipartFile profilePhotoName,
      MultipartFile[] teacherPhotoFiles) throws Exception {
    
    System.out.println("바꿀 유저 : " + member);
    System.out.println(teacher);
    
//    Member loginUser = (Member) session.getAttribute("loginUser");
//    
//    photoWriter.upload(
//        profilePhoto, teacherPhotoFiles, teacherPhotoNames,
//        loginUser, session);
//    
//    mypageService.update(loginUser);

    return "redirect:detail";
  }
}
