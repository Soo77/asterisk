package com.ast.eom.controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
  
  private void supplementInitialMemberInfo(Member member, Member loginUser, String email1, String email2, String[] lessonDay) {
    member.setMemberNo(loginUser.getMemberNo());
    member.setMemberTypeNo(loginUser.getMemberTypeNo());
    member.setEmail(email1+"@"+email2);
    
    if (member.getTel().equals(""))
      member.setTel(null);
    
    if (lessonDay != null) {
      StringBuilder sb = new StringBuilder();
      sb.append("0000000");
      for(int i = 0; i < lessonDay.length; i++) {
        sb.setCharAt(Integer.parseInt(lessonDay[i]), '1'); 
      }
      member.setLessonDays(sb.toString());
    }
    
  }
  
  private void updateLoginUser(
      Member loginUser, Member member, HttpSession session) {
    
    member.setRegisteredDate(loginUser.getRegisteredDate());
    member.setGender(loginUser.getGender());
    member.setDateOfBirth(loginUser.getDateOfBirth());
    member.setId(loginUser.getId());
    member.setPassword(null);
    member.setName(loginUser.getName());
    member.setUserEmailChecked(loginUser.isUserEmailChecked());
    member.setActivationKey(loginUser.getActivationKey());
    if (member.getProfilePhoto() == null)
      member.setProfilePhoto(loginUser.getProfilePhoto());
    
    session.setAttribute("loginUser", member);
    
  }
  
  @GetMapping("detail")
  public void detail(HttpSession session) throws Exception {
    Map<String, Object> memberInfoMap = mypageService.getMemberInfoMap();
    session.setAttribute("memberInfoMap", memberInfoMap);
  }
  
  @PostMapping("update")
  public String update(
      HttpSession session,
      Member member,
      String email1,
      String email2,
      Teacher teacher,
      String[] schoolTypeNo,
      String[] subjectNo,
      String[] wantedFee,
      String[] lessonDay,
      String[] teacherPhotoNames,
      MultipartFile profilePhotoName,
      MultipartFile[] teacherPhotoFiles,
      Student student,
      Parents parents,
      String[] childrenNo,
      String kakaoCheck) throws Exception {
    
    Member loginUser = (Member) session.getAttribute("loginUser");
    supplementInitialMemberInfo(member, loginUser, email1, email2, lessonDay);
    
    photoWriter.upload(
        profilePhotoName, teacherPhotoFiles, teacherPhotoNames,
        member, session);

    if (loginUser.getMemberTypeNo() == 1) {
      student.setStudentNo(loginUser.getMemberNo());
      mypageService.updateStudent(
          member, student, schoolTypeNo, subjectNo, wantedFee);
      
    } else if (loginUser.getMemberTypeNo() == 2) {
      mypageService.updateParents(member, parents, childrenNo);
      
    } else if (loginUser.getMemberTypeNo() == 3) {
      teacher.setTeacherNo(loginUser.getMemberNo());
      mypageService.updateTeacher(
          member, teacher, schoolTypeNo, subjectNo, wantedFee);
      
    } else if (loginUser.getMemberTypeNo() == 4) {
      mypageService.updateMember(member);
      
    }
    updateLoginUser(loginUser, member, session);

    return "redirect:detail";
  }
  
  @GetMapping("redirectLessonPage")
  public void redirectLessonPage(
      HttpServletResponse response,
      HttpSession session,
      String thisChildNo) throws Exception {
    
    session.setAttribute("childrenNo", Integer.parseInt(thisChildNo));
    response.sendRedirect("/app/lesson/list");
  }
  
  @GetMapping("verifyTheChild")
  @ResponseBody
  public Object verifyTheChild(String childId) throws Exception {
    return mypageService.getChild(childId);
  }
}
