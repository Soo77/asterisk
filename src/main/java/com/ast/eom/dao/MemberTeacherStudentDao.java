package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.MemberTeacherStudent;

// DAO 사용 규칙을 정의한다.
public interface MemberTeacherStudentDao {
  List<MemberTeacherStudent> listTeacher() throws Exception;
  List<MemberTeacherStudent> listTeacher2() throws Exception;
  List<MemberTeacherStudent> listStudent() throws Exception;
  MemberTeacherStudent detailTeacher(int no) throws Exception;
}








