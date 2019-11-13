package com.ast.eom.service;

import java.util.Map;

import com.ast.eom.domain.Member;
import com.ast.eom.domain.Teacher;

public interface MypageService {
  Map<String, Object> getMemberInfoMap() throws Exception;

  int updateMember(Member member);
  int updateTeacher(Member member, Teacher teacher, String[] schoolTypeNo, String[] subjectNo, String[] wantedFee);

}
