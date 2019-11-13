package com.ast.eom.service.impl;

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
    
    /*
     * List<MemberTeacherStudent> memberList = null;
     * 
     * if (memberTypeNo == 1) { memberList = memberTeacherStudentDao.listStudent(memberTypeNo); }
     * else if (memberTypeNo == 3) { memberList = memberTeacherStudentDao.listTeacher(memberTypeNo);
     * }
     */
      
      params.put("memberTypeNo", memberTypeNo);
    /* params.put("memberList", memberList); */
      
    return memberTeacherStudentDao.listTeacher(params);
  }
  
  @Override
  public List<MemberTeacherStudent> list2(int memberTypeNo) throws Exception {
    
    HashMap<String, Object> params = new HashMap<>();
    
    /*
     * List<MemberTeacherStudent> memberList = null;
     * 
     * if (memberTypeNo == 1) { memberList = memberTeacherStudentDao.listStudent(memberTypeNo); }
     * else if (memberTypeNo == 3) { memberList = memberTeacherStudentDao.listTeacher(memberTypeNo);
     * }
     */
      
      params.put("memberTypeNo", memberTypeNo);
    /* params.put("memberList", memberList); */
      
    return memberTeacherStudentDao.listStudent(params);
  }
  
}
