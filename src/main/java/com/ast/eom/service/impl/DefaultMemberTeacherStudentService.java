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
  public List<MemberTeacherStudent> listTeacher(int memberTypeNo) throws Exception {
    return memberTeacherStudentDao.listTeacher(memberTypeNo);
  }

  @Override
  public List<MemberTeacherStudent> listTeacher2() throws Exception {
    return memberTeacherStudentDao.listTeacher2();
  }

  @Override
  public List<MemberTeacherStudent> listStudent(int memberTypeNo) throws Exception {
    return memberTeacherStudentDao.listStudent(memberTypeNo);
  }

  @Override
  public List<MemberTeacherStudent> detailTeacher(int no) throws Exception {
    return memberTeacherStudentDao.detailTeacher(no);
  }
  
  
}
