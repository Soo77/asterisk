package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.DayLesson;

public interface DayLessonDao {
//  DayLesson findBy(int dayLessonNo) throws Exception;
  public List<DayLesson> findAll(int lessonNo) throws Exception;
  public int insert(DayLesson dayLessonNo) throws Exception;
  int update(DayLesson dayLesson) throws Exception;
  int delete(int dayLessonNo) throws Exception;
}








