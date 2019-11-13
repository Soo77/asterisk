package com.ast.eom.service;

import java.util.Map;

import com.ast.eom.domain.Member;

public interface MypageService {
  Map<String, Object> getMemberInfoMap() throws Exception;

  int update(Member loginUser);
}
