package com.ast.eom.service.impl;

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
    List<MemberTeacherStudent> memberTeacherStudent = memberTeacherStudentDao.detailTeacher(no);
    return memberTeacherStudent;
  }
  
  
  @Override
  public List<MemberTeacherStudent> list(int memberTypeNo) throws Exception {
    List<MemberTeacherStudent> memberList = null;
    if (memberTypeNo == 1) {
      memberList = memberTeacherStudentDao.listStudent(memberTypeNo);
    } else if (memberTypeNo == 3) {
      memberList = memberTeacherStudentDao.listTeacher(memberTypeNo);
    }
    
    return memberList;
  }
  
  
  
}
