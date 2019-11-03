package com.ast.eom.service;

import java.util.Map;

import com.ast.eom.domain.Member;

public interface MypageService {
  Member getTempMember(int no) throws Exception;
  Map<String, Object> getMemberInfoMapBy(Member member) throws Exception;
}
