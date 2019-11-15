package com.ast.eom.service.impl;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ast.eom.dao.JoinDao;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Parents;
import com.ast.eom.domain.WantedLesson;
import com.ast.eom.service.JoinService;

@Service
public class DefaultJoinService implements JoinService {

  @Autowired
  JoinDao joinDao;

  String uploadDir;

  // 선생님 회원가입
  @Override
  public int insert(Member member) 
      throws Exception {
    return joinDao.insert(member);
  }

  //선생님 회원가입
  @Override
  public int teacherInsert(Map<String, Object> params) 
      throws Exception {
    return joinDao.teacherInsert(params);
  }

  //학부모 회원가입
  @Override
  public int parentsInsert(Parents joinedParents) throws Exception {
    return joinDao.parentsInsert(joinedParents);
  }
  
  @Override
  public int bindStudentAndParents(Map<String, Object> parentsMap) {
    return joinDao.bindStudentAndParents(parentsMap);
  }

  //학생 회원가입
  @Override
  public int studentInsert(Map<String, Object> params) 
      throws Exception {
    return joinDao.studentInsert(params);
  }

  @Override
  public int updateCheck(String key) 
      throws Exception {
    return joinDao.updateCheck(key);
  }

  @Override
  public int checkOverId(String id) throws Exception {
    return joinDao.checkOverId(id);
  }

  @Override
  public int checkOverEmail(String email) throws Exception {
    return joinDao.checkOverEmail(email);
  }

  @Override
  public int checkOverTel(String tel) throws Exception {
    return joinDao.checkOverTel(tel);
  }

  @Override
  public int checkOverAccountNo(String accountno) throws Exception {
    return joinDao.checkOverAccountNo(accountno);
  }

  @Override
  public int insertForStudentAndTeacher(Member member) {
    return joinDao.insertForStudentAndTeacher(member);
  }
  
  @Override
  public int wantedLessonFotStudentInsert(WantedLesson wantedLesson) {
    return joinDao.wantedLessonFotStudentInsert(wantedLesson);
  }
  
  @Override
  public int teacherSchoolsInsert(Map<String, Object> schoolParams) {
    return joinDao.teacherSchoolsInsert(schoolParams);
  }
  
  @Override
  public int teacherSubjectInsert(Map<String, Object> subjectParams) {
    return joinDao.teacherSubjectInsert(subjectParams);
  }
}
