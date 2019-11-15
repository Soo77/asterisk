package com.ast.eom.service.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ast.eom.dao.MemberTeacherStudentDao;
import com.ast.eom.domain.MemberTeacherStudent;
import com.ast.eom.service.MemberTeacherStudentService;

@Service
public class DefaultMemberTeacherStudentService implements MemberTeacherStudentService {

  @Autowired
  private MemberTeacherStudentDao memberTeacherStudentDao;
  
  @Override
  public List<MemberTeacherStudent> get(int no) throws Exception {
    
    List<MemberTeacherStudent> detailStudent = memberTeacherStudentDao.detailStudent(no);
    
    return detailStudent;
    
  }
  
  @Override
  public List<MemberTeacherStudent> get2 (int no) throws Exception {
    
    List<MemberTeacherStudent> detailTeacher = memberTeacherStudentDao.detailTeacher(no);
    
    return detailTeacher;
    
  }
  
  
  @Override
  public List<MemberTeacherStudent> list(int memberTypeNo) throws Exception {
    
    HashMap<String, Object> params = new HashMap<>();
    
      params.put("memberTypeNo", memberTypeNo);
      
    return memberTeacherStudentDao.listTeacher(params);
  }
  
  @Override
  public List<MemberTeacherStudent> list2(int memberTypeNo) throws Exception {
    
    HashMap<String, Object> params = new HashMap<>();
    
      params.put("memberTypeNo", memberTypeNo);
      
    return memberTeacherStudentDao.listStudent(params);
  }
  
  @Override
  public List<MemberTeacherStudent> searchBy(HashMap<String, Object> searchInfo) throws Exception {
    
    int memTypeNo = Integer.parseInt((String) searchInfo.get("memTypeNo"));
    
    if (memTypeNo == 1) {
      return memberTeacherStudentDao.searchStudent(searchInfo);
      
    } else if (memTypeNo == 3) {
      List<MemberTeacherStudent> teachers = memberTeacherStudentDao.searchTeacher(searchInfo);
      
      String today = String.valueOf(new Date(System.currentTimeMillis()));
      int todayYear = Integer.parseInt(today.substring(0, 4));
      
      for (int i = 0; i < teachers.size(); i++) {
        Date tempDate = teachers.get(i).getDateOfBirth();
        String teacherDate = String.valueOf(tempDate);
        int teacherYear = Integer.parseInt(teacherDate.substring(0, 4));
        
        teachers.get(i).setTeacherAge(todayYear - teacherYear + 1);
      }
      
      return teachers;
      
    } else {
      throw new Exception("잘못된 접근입니다.");
    }
    
  }
  
}
