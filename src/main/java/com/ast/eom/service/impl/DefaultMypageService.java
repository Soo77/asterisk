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
import com.ast.eom.domain.Teacher;
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
      if (member.size() > 0) {
        for (int i = 0; i < children.size(); i++) {
          children.get(i).setId(member.get(i).getId());
          children.get(i).setName(member.get(i).getName());
        }
        parents.setStudents(children);
      }
      
      memberInfoMap.put("parents", parents);
      
    } else if (memberTypeNo == 3) {
      
      memberInfoMap.put("teacher", mypageDao.getTeacher(memberNo));
      memberInfoMap.put("teacherLessons", mypageDao.getLessonsForTeacher(memberNo));
      memberInfoMap.put("lessonSubjects", mypageDao.getLessonSubjects(memberNo));
      memberInfoMap.put("teacherPhotos", mypageDao.getTeacherPhotos(memberNo));
      
    } else if (memberTypeNo == 4) {
      
    } else {
      throw new Exception("DB에서 회원정보를 가져오던 중 오류 발생!");
      
    }
    
    return memberInfoMap;
  }
  
  @Override
  public int updateMember(Member member) throws Exception {
    return mypageDao.updateMember(member);
  }
  
  @Override
  public int updateStudent(Member member, Student student, String[] schoolTypeNo, String[] subjectNo,
      String[] wantedFee) throws Exception {
    updateMember(member);
    mypageDao.updateStudent(student);
    
    int[] thisSubjectNo = new int[schoolTypeNo.length];
    for (int i = 1; i < schoolTypeNo.length; i++) {
      int schoolTypeNo2 = Integer.parseInt(schoolTypeNo[i]);
      int subjectNo2 = Integer.parseInt(subjectNo[i]);
      thisSubjectNo[i] = (3*(schoolTypeNo2-1)+subjectNo2);
      System.out.println("과목: " + thisSubjectNo[i]);
    }
    
    Map<String, Object> studentInfo = new HashMap<>();
    
    mypageDao.deleteAllWantedLessonRelatedTo(member.getMemberNo());
    
    // 화면에 표시할 때 템플릿을 남기게 구현하는 바람에 인덱스가 1부터 시작
    for (int i = 1; i < schoolTypeNo.length; i++) {
      studentInfo.put("studentNo", member.getMemberNo());
      studentInfo.put("subjectNo", thisSubjectNo[i]);
      studentInfo.put("wantedFee", wantedFee[i]);
      mypageDao.insertWantedLessonOf(studentInfo);
    }
    
    return 1;
  }
  
  @Override
  public int updateParents(
      Member member,
      Parents parents,
      String[] childrenNo) throws Exception {
    
    updateMember(member);
    
    Map<String, Object> childrenInfo = new HashMap<>();
    childrenInfo.put("parentsNo", member.getMemberNo());
    
    // 하기 전에 다 지우는거 잊지 말것
    mypageDao.deleteAllParentsNoOfStudents(member.getMemberNo());
    
    // 화면에 표시할 때 템플릿을 남기게 구현하는 바람에 인덱스가 1부터 시작
    for (int i = 1; i < childrenNo.length; i++) {
      System.out.println(childrenNo[i]);
      childrenInfo.put("childNo", Integer.parseInt(childrenNo[i]));
      mypageDao.updateParentsOfStudent(childrenInfo);
    }
    
    return 1;
  }

  @Override
  public int updateTeacher(
      Member member,
      Teacher teacher,
      String[] schoolTypeNo,
      String[] subjectNo,
      String[] wantedFee) throws Exception {
    
    updateMember(member);
    mypageDao.updateTeacher(teacher);
    
    int[] thisSubjectNo = new int[schoolTypeNo.length];
    for (int i = 1; i < schoolTypeNo.length; i++) {
      int schoolTypeNo2 = Integer.parseInt(schoolTypeNo[i]);
      int subjectNo2 = Integer.parseInt(subjectNo[i]);
      thisSubjectNo[i] = (3*(schoolTypeNo2-1)+subjectNo2);
      System.out.println("과목: " + thisSubjectNo[i]);
    }
    
    Map<String, Object> teacherInfo = new HashMap<>();
    
    mypageDao.deleteAllLessonSubjectRelatedTo(member.getMemberNo());
    
    // 화면에 표시할 때 템플릿을 남기게 구현하는 바람에 인덱스가 1부터 시작
    for (int i = 1; i < schoolTypeNo.length; i++) {
      teacherInfo.put("teacherNo", member.getMemberNo());
      teacherInfo.put("subjectNo", thisSubjectNo[i]);
      teacherInfo.put("wantedFee", wantedFee[i]);
      mypageDao.insertLessonSubjectOf(teacherInfo);
    }
    
    return 1;
  }
  
  @Override
  public Member getChild(String childId) throws Exception {
    return mypageDao.getChildBy(childId);
  }

}
