package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.Member;

// DAO 사용 규칙을 정의한다.
public interface MemberDao {
  List<Member> listMember() throws Exception;
  Member detailMember(int no) throws Exception;
}








