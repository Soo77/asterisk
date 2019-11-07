package com.ast.eom.service;

import java.util.List;
import com.ast.eom.domain.MemberTeacherStudent;

public interface MemberTeacherStudentService {
  
  List<MemberTeacherStudent> get(int no) throws Exception;
  List<MemberTeacherStudent> list(int memberTypeNo) throws Exception;
  
}
