package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.DayLesson;

public interface DayLessonDao {
  List<DayLesson> findAll(int lessonNo) throws Exception;

}








