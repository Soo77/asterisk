package com.ast.eom.service;

import java.util.HashMap;
import java.util.List;
import com.ast.eom.domain.MemberTeacherStudent;

public interface MemberTeacherStudentService {
  
  List<MemberTeacherStudent> get(int no) throws Exception;
  List<MemberTeacherStudent> get2(int no) throws Exception;
  List<MemberTeacherStudent> list(int memberTypeNo) throws Exception;
  List<MemberTeacherStudent> list2(int memberTypeNo) throws Exception;
  List<MemberTeacherStudent> searchBy(HashMap<String, Object> searchInfo) throws Exception;
  List<MemberTeacherStudent> review(int no) throws Exception;
  List<MemberTeacherStudent> photo(int no) throws Exception;
  List<MemberTeacherStudent> school(int no) throws Exception;
  

  
}
