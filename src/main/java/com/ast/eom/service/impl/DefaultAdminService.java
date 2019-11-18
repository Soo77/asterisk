package com.ast.eom.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ast.eom.dao.AdminDao;
import com.ast.eom.dao.MypageDao;
import com.ast.eom.domain.Member;
import com.ast.eom.service.AdminService;

@Service
public class DefaultAdminService implements AdminService {
  
  @Autowired
  AdminDao adminDao;
  @Autowired
  MypageDao mypageDao;
  
  private void prepareBasicMemberInfoMapOf(
      int memberTypeNo, Map<String, Object> memberInfoMapForAdmin) throws Exception {
    
    List<Member> memberList = adminDao.getBasicMemberInfo(memberTypeNo);
    List<Integer> memberAge = new ArrayList<>();
    
    int thisYear, memberYear, age;
    String todayStr;
    
    for (Member member : memberList) {
      todayStr = String.valueOf(new Date(System.currentTimeMillis()));
      thisYear = Integer.parseInt(todayStr.substring(0,4));
      
      memberYear = Integer.parseInt(
          String.valueOf(member.getDateOfBirth()).substring(0,4));
      
      age = thisYear - memberYear + 1;
      memberAge.add(age);
    }
    
    memberInfoMapForAdmin.put("memberList", memberList);
    memberInfoMapForAdmin.put("memberAge", memberAge);
    
  }
  
  @Override
  public Object loadMemberInfoMapOf(int memberTypeNo) throws Exception {
    
    Map<String, Object> memberInfoMapForAdmin = new HashMap<>();
    
    if (memberTypeNo == 1) {
      prepareBasicMemberInfoMapOf(memberTypeNo, memberInfoMapForAdmin);
      
      return memberInfoMapForAdmin;
      
    } else if (memberTypeNo == 2) {
      prepareBasicMemberInfoMapOf(memberTypeNo, memberInfoMapForAdmin);
      
      return memberInfoMapForAdmin;
      
    } else if (memberTypeNo == 3) {
      prepareBasicMemberInfoMapOf(memberTypeNo, memberInfoMapForAdmin);
      
      return memberInfoMapForAdmin;
      
    } else if (memberTypeNo == 99) {
      return memberInfoMapForAdmin;
      
    } else {
      throw new Exception("잘못된 방식의 요청입니다!");
      
    }
    
  }
  
}
