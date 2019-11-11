package com.ast.eom.service;

import java.util.List;
import com.ast.eom.domain.MemberTeacherStudent;

public interface MemberTeacherStudentService {
  
  List<MemberTeacherStudent> get(int no) throws Exception;
  List<MemberTeacherStudent> get2(int no) throws Exception;
  List<MemberTeacherStudent> list(int memberTypeNo, int pageNo, int pageSize) throws Exception;
  public int size(int memberTypeNo) throws Exception;

  
}
