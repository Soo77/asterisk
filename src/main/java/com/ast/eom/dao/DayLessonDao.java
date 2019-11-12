package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.DayLesson;

public interface DayLessonDao {
  public List<DayLesson> findAll(int lessonNo) throws Exception;
  DayLesson findBy(int dayLessonNo) throws Exception;
  int update(DayLesson dayLessonNo) throws Exception;
}








