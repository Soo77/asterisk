package com.ast.eom.dao;

import java.util.List;

import com.ast.eom.domain.Lesson;
import com.ast.eom.domain.Member;

public interface MainPageDao {
  List<Lesson> getRandomLessons() throws Exception;
  Member getMember() throws Exception;
  
}
