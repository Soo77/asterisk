package com.ast.eom.service;

import java.util.Map;
import com.ast.eom.domain.Member;

public interface JoinService {
  int insert(Member member) throws Exception;
  int teacherInsert(Map<String, Object> params) throws Exception;
  int parentsInsert(Map<String, Object> params) throws Exception;
  int studentInsert(Map<String, Object> params) throws Exception;
  int checkOverId(String id) throws Exception;
  int checkOverEmail(String email) throws Exception;
  int checkOverTel(String tel) throws Exception;
  int checkOverAccountNo(String accountno) throws Exception;
  int updateCheck(String key) throws Exception;
}
