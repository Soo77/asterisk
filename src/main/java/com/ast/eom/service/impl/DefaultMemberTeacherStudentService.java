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
  public List<MemberTeacherStudent> list(int memberTypeNo, int pageNo, int pageSize) throws Exception {

    HashMap<String,Object> param = new HashMap<>();
    param.put("memberTypeNo", memberTypeNo);
    param.put("offset", (pageNo - 1) * pageSize);
    param.put("pageSize", pageSize);

    List<MemberTeacherStudent> memberList = null;
    
    if (memberTypeNo == 1) {
      memberList = memberTeacherStudentDao.listStudent(param);
    } else if (memberTypeNo == 3) {
      memberList = memberTeacherStudentDao.listTeacher(param);
    }
    System.out.println("param"+ param);
    return memberList;
  }
  
  
    @Override
    public int size(int memberTypeNo) throws Exception {
      return memberTeacherStudentDao.countAll(memberTypeNo);
    }
   
  
  
}
