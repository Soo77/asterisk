package com.ast.eom.dao;

import java.util.Map;
import com.ast.eom.domain.Member;

public interface AuthDao {
  Member findId(Member member) throws Exception;
  int findPw(Member member) throws Exception;
  int pwChange(Member member) throws Exception;
  Member login(Map<String, String> params) throws Exception;
}
