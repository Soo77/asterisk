package com.ast.eom.service;

import java.util.List;
import com.ast.eom.domain.DayLesson;

public interface DayLessonService {
  List<DayLesson> list(int lessonNo) throws Exception;
  DayLesson get(int dayLessonNo) throws Exception;
  int update(DayLesson dayLessonNo) throws Exception;
}










