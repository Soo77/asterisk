package com.ast.eom.dao;

import java.util.List;

import com.ast.eom.domain.Lesson;
import com.ast.eom.domain.Member;

public interface AdminDao {
  List<Member> getBasicMemberInfo(int memberNo) throws Exception;
  Member getMember(int memberNo) throws Exception;
  int approveTeacherCertificationOf(int teacherNo) throws Exception;
  int acceptThis(int memberNo) throws Exception;
  int rejectThis(int memberNo) throws Exception;
  List<Lesson> getPendingLessons() throws Exception;
}
