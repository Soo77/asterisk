package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.MemberTeacherStudent;

// DAO 사용 규칙을 정의한다.
public interface MemberTeacherStudentDao {
  List<MemberTeacherStudent> listMember() throws Exception;
  List<MemberTeacherStudent> listMember2() throws Exception;
  MemberTeacherStudent detailMember(int no) throws Exception;
}








