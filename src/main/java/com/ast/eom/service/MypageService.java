package com.ast.eom.service;

import java.util.Map;

import com.ast.eom.domain.Member;
import com.ast.eom.domain.Parents;
import com.ast.eom.domain.Student;
import com.ast.eom.domain.Teacher;

public interface MypageService {
  Map<String, Object> getMemberInfoMap() throws Exception;

  int updateMember(Member member) throws Exception;
  int updateTeacher(Member member, Teacher teacher,
      String[] schoolTypeNo, String[] subjectNo, String[] wantedFee)
          throws Exception;
  int updateStudent(Member member, Student student,
      String[] schoolTypeNo, String[] subjectNo, String[] wantedFee)
          throws Exception;
  int updateParents(Member member, Parents parents, String[] childrenId) throws Exception;
  Member getChild(String childId) throws Exception;


}
