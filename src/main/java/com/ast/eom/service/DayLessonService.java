package com.ast.eom.service;

import java.util.List;
import com.ast.eom.domain.DayLesson;

public interface DayLessonService {
  List<DayLesson> list(int lessonNo) throws Exception;
  int insert(DayLesson dayLesson) throws Exception;
  int update(DayLesson dayLesson) throws Exception;
  int delete(int dayLessonNo, int lessonNo) throws Exception;
}
