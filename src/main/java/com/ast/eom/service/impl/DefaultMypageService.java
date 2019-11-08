package com.ast.eom.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ast.eom.dao.MypageDao;
import com.ast.eom.domain.Member;
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
      
    } else if (memberTypeNo == 2) {
      memberInfoMap.put("parents", mypageDao.getParents(memberNo));
      
    } else if (memberTypeNo == 3) {
      memberInfoMap.put("teacher", mypageDao.getTeacher(memberNo));
      
    } else {
      throw new Exception("오류 발생!");
      
    }
    
    return memberInfoMap;
  }

}
