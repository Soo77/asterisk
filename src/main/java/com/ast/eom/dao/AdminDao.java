package com.ast.eom.dao;

import java.util.List;

import com.ast.eom.domain.Member;

public interface AdminDao {

  List<Member> getBasicMemberInfo(int memberNo) throws Exception;

}
