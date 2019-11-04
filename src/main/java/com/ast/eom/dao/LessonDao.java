package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.Lesson;

public interface LessonDao {
  List<Lesson> findAllTeacherBy() throws Exception;
  List<Lesson> findAllStudentBy() throws Exception;
  Lesson findBy(int no) throws Exception;
  int insert(Lesson lesson) throws Exception;
  int update(Lesson lesson) throws Exception;
  int delete(int no) throws Exception;
}
