package com.ast.eom.dao;

import com.ast.eom.domain.Member;

// DAO 사용 규칙을 정의한다.
public interface MemberDao {
  Member detailMember(int no) throws Exception;
}








