package com.ast.eom.service;

import java.util.List;
import com.ast.eom.domain.DayLesson;

public interface DayLessonService {
//  DayLesson get(int dayLessonNo) throws Exception;
  List<DayLesson> list(int lessonNo) throws Exception;
  int insert(DayLesson dayLesson) throws Exception;
  int update(DayLesson dayLesson) throws Exception;
  int delete(int dayLessonNo) throws Exception;
  int interruptionRequest(int memberTypeNo, int memberNo, String stopReason);
}










