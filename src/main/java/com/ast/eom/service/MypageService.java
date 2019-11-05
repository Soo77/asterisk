package com.ast.eom.service;

import java.util.Map;

import com.ast.eom.domain.Member;

public interface MypageService {
  Map<String, Object> getMemberInfoMapBy(Member member) throws Exception;
}
