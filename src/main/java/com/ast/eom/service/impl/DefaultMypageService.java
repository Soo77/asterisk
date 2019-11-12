package com.ast.eom.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ast.eom.dao.MypageDao;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Parents;
import com.ast.eom.domain.Student;
import com.ast.eom.service.MypageService;

@Service
public class DefaultMypageService implements MypageService {
  
  @Autowired
  private MypageDao mypageDao;
  private HttpSession session;
  
  public DefaultMypageService(HttpSession session) {
    this.session = session;
  }

  @Override
  public Map<String, Object> getMemberInfoMap() throws Exception {
    Member loginUser = (Member) session.getAttribute("loginUser");
    
    String[] mypageEmail = loginUser.getEmail().split("@");
    session.setAttribute("mypageEmail", mypageEmail);
    Map<String, Object> memberInfoMap = new HashMap<>();
    
    int memberTypeNo = loginUser.getMemberTypeNo();
    int memberNo = loginUser.getMemberNo();
    
    if (memberTypeNo == 1) {
      
      memberInfoMap.put("student", mypageDao.getStudent(memberNo));
      memberInfoMap.put("wantedLessons", mypageDao.getWantedLessons(memberNo));
      memberInfoMap.put("studentLessons", mypageDao.getLessonsForStudent(memberNo));
      
    } else if (memberTypeNo == 2) {
      Parents parents = mypageDao.getParents(memberNo);
      List<Student> children = parents.getStudents();
      List<Integer> childrenNo = new ArrayList<>();
      for (Student child : children) {
        childrenNo.add(child.getStudentNo());
      }
      
      List<Member> member = mypageDao.getChildrenIdAndName(childrenNo);
      for (int i = 0; i < children.size(); i++) {
        children.get(i).setId(member.get(i).getId());
        children.get(i).setName(member.get(i).getName());
      }
      parents.setStudents(children);
      
      memberInfoMap.put("parents", parents);
      
    } else if (memberTypeNo == 3) {
      
      memberInfoMap.put("teacher", mypageDao.getTeacher(memberNo));
      memberInfoMap.put("teacherLessons", mypageDao.getLessonsForTeacher(memberNo));
      memberInfoMap.put("lessonSubjects", mypageDao.getLessonSubjects(memberNo));
      memberInfoMap.put("teacherPhotos", mypageDao.getTeacherPhotos(memberNo));
      
    } else {
      throw new Exception("DB에서 회원정보를 가져오던 중 오류 발생!");
      
    }
    
    return memberInfoMap;
  }

  @Override
  public int update(Member loginUser) {
    
    return 1;
  }

}
