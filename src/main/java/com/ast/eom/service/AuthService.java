package com.ast.eom.service;

import java.util.Map;
import com.ast.eom.domain.Member;

public interface AuthService {
  String findId(Member member) throws Exception;
  int findPw(Member member) throws Exception;
  int pwChange(Member member) throws Exception;
  Member login(Map<String, String> params) throws Exception;
}
