package com.ast.eom.service;

import java.util.Map;

public interface AdminService {
  Object loadMemberInfoMapOf(int memberTypeNo, int pageSize, int curPage) throws Exception;
  Map<String, Object> getInfoMap(int memberNo, int memberTypeNo) throws Exception;
  int approve(int teacherNo) throws Exception;
  int accept(int memberNo) throws Exception;
  int reject(int memberNo) throws Exception;
  Map<String, Object> getPendingLessons() throws Exception;
  Map<String, Object> getPendingLessonsInfoMap(int lessonNo) throws Exception;
  int approveInterruption(int lessonNo) throws Exception;
  
}
