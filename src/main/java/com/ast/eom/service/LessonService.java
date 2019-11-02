package com.ast.eom.service;

import java.util.List;
import com.ast.eom.domain.Lesson;

public interface LessonService {
  List<Lesson> list(int memberTypeNo) throws Exception;
  Lesson get(int no) throws Exception;
  void insert(Lesson lesson) throws Exception;
  void update(Lesson lesson) throws Exception;
  void delete(int no) throws Exception;
  
  List<Lesson> currList(int lessonNo) throws Exception;
}










