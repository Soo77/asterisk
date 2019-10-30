package com.ast.eom.service.impl;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ast.eom.dao.AuthDao;
import com.ast.eom.domain.Member;
import com.ast.eom.service.AuthService;

@Service
public class DefaultAuthService implements AuthService {
  
  @Autowired
  AuthDao authDao;

  @Override
  public Member findId(Member member) throws Exception {
    return authDao.findId(member);
  }

  @Override
  public int findPw(Member member) throws Exception {
    return authDao.findPw(member);
  }

  @Override
  public int pwChange(Member member) throws Exception {
    return authDao.pwChange(member);
  }

  @Override
  public Member login(Map<String, String> params) throws Exception {
    return authDao.login(params);
  }
  
}
