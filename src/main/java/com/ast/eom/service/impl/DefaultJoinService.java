package com.ast.eom.service.impl;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ast.eom.dao.JoinDao;
import com.ast.eom.domain.Member;
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
}
