package com.ast.eom.service;

import java.util.List;
import com.ast.eom.domain.MemberTeacherStudent;

public interface MemberTeacherStudentService {

  List<MemberTeacherStudent> listTeacher(int memberTypeNo) throws Exception;

  List<MemberTeacherStudent> listStudent(int memberTypeNo) throws Exception;

  List<MemberTeacherStudent> detailTeacher(int no) throws Exception;

}
