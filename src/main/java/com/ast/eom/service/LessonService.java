package com.ast.eom.service;

import java.util.HashMap;
import java.util.List;
import com.ast.eom.domain.Lesson;

public interface LessonService {
  List<Lesson> list(int memberTypeNo, int memberNo) throws Exception;
  Lesson get(int no) throws Exception;
  void insert(Lesson lesson) throws Exception;
  void updateContentsAndDays(Lesson lesson) throws Exception;
  void updateDateAndTime(Lesson lesson) throws Exception;
  void deleteContentsAndDays(int currLessonNo) throws Exception;
  void delete(int no) throws Exception;
  void deleteCurrAndContsAndLesson(int lessonNo) throws Exception;
  
  void addContentsAndDays(Lesson lesson) throws Exception;
  void addLesson(Lesson lesson) throws Exception;
  void addCurriculum(Lesson lesson) throws Exception;
  int findSubNo(HashMap<String, Object> param) throws Exception;
  
  Lesson lessonDetail(int lessonNo) throws Exception;
  
  // 중단 요청 처리
  void interruptionRequest(int memberTypeNo, int lessonNo, String stopReason) throws Exception;
  
  // 후기 작성
  void insertReview(int lessonNo, String teacherReview, int teacherEvaluation) throws Exception;
}










