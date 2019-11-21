package com.ast.eom.dao;

import java.util.HashMap;
import java.util.List;
import com.ast.eom.domain.MemberTeacherStudent;

// DAO 사용 규칙을 정의한다.
public interface MemberTeacherStudentDao {
  List<MemberTeacherStudent> listTeacher(HashMap<String, Object> params) throws Exception;
  List<MemberTeacherStudent> listStudent(HashMap<String, Object> params) throws Exception;
  List<MemberTeacherStudent> detailTeacher(int no) throws Exception;
  List<MemberTeacherStudent> detailStudent(int no) throws Exception;
  List<MemberTeacherStudent> searchTeacher(HashMap<String, Object> searchInfo) throws Exception;
  List<MemberTeacherStudent> searchStudent(HashMap<String, Object> searchInfo) throws Exception;
  List<MemberTeacherStudent> reviewTeacher(int no) throws Exception;
  List<MemberTeacherStudent> reviewStudent(int no) throws Exception;
  List<MemberTeacherStudent> photoTeacher(int no) throws Exception;
  
}

