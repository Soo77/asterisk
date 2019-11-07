package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.MemberTeacherStudent;

// DAO 사용 규칙을 정의한다.
public interface MemberTeacherStudentDao {
  List<MemberTeacherStudent> listTeacher(int memberTypeNo) throws Exception;
  List<MemberTeacherStudent> listStudent(int memberTypeNo) throws Exception;
  List<MemberTeacherStudent> detailTeacher(int no) throws Exception;
}








