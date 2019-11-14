package com.ast.eom.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ast.eom.dao.DayLessonDao;
import com.ast.eom.domain.DayLesson;
import com.ast.eom.service.DayLessonService;

@Service
public class DefaultDayLessonService implements DayLessonService {

  @Resource private DayLessonDao dayLessonDao;

//  @Override
//  public DayLesson get(int dayLessonNo) throws Exception {
//    DayLesson dayLesson = dayLessonDao.findBy(dayLessonNo);
//    return dayLesson;
//  }
  
  @Override
  public List<DayLesson> list(int lessonNo) throws Exception {
    return dayLessonDao.findAll(lessonNo);
  }
  
  @Override
  public int insert(DayLesson dayLesson) throws Exception {
    return dayLessonDao.insert(dayLesson);
  }
  
  @Override
  public int update(DayLesson dayLesson) throws Exception {
    return dayLessonDao.update(dayLesson);
  }
  
  @Override
  public int delete(int dayLessonNo) throws Exception {
    return dayLessonDao.delete(dayLessonNo);
  }
}
