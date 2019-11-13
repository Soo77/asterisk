package com.ast.eom.service;

import java.util.List;
import com.ast.eom.domain.MemberTeacherStudent;

public interface MemberTeacherStudentService {
  
  List<MemberTeacherStudent> get(int no) throws Exception;
  List<MemberTeacherStudent> get2(int no) throws Exception;
  List<MemberTeacherStudent> list(int memberTypeNo) throws Exception;
  List<MemberTeacherStudent> list2(int memberTypeNo) throws Exception;

  
}
