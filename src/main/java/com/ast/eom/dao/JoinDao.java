package com.ast.eom.dao;

import java.util.Map;
import com.ast.eom.domain.Member;

public interface JoinDao {
  int insert(Member member) throws Exception;
  int teacherInsert(Map<String, Object> params) throws Exception;
//  public Date stringToDate(Member member) throws Exception;
//  public String findingID(String email) throws Exception;
  int checkOverId(String id) throws Exception;
  int checkOverEmail(String email) throws Exception;
  int checkOverTel(String tel) throws Exception;
}