package com.ast.eom.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ast.eom.dao.LessonDao;
import com.ast.eom.domain.Lesson;
import com.ast.eom.service.LessonService;

@Service
public class DefaultLessonService implements LessonService {

  @Resource private LessonDao lessonDao;

  @Override
  public List<Lesson> list(int memberTypeNo) throws Exception {
    if (memberTypeNo ==1) {
      return lessonDao.findAllTeacherBy();
    } else if (memberTypeNo == 2) {
      return lessonDao.findAllTeacherBy();
    } else if (memberTypeNo == 3) {
      return lessonDao.findAllStudentBy();
    } else {
      throw new Exception("너 뭐냐?");
    }
  }
  
  @Override
  public Lesson get(int no) throws Exception {
    Lesson lesson = lessonDao.findBy(no);
    if (lesson == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    } 
    return lesson;
  }

  @Transactional
  @Override
  public void insert(Lesson lesson) throws Exception {

    lessonDao.insert(lesson);

  }
  
  @Override
  public void updateContentsAndDays(Lesson lesson) throws Exception {
    lessonDao.updateContentsAndDays(lesson);
  }
  
  @Override
  public void updateDateAndTime(Lesson lesson) throws Exception {
    lessonDao.updateDateAndTime(lesson);
  }
  
  @Override
  public void addContentsAndDays(Lesson lesson) throws Exception {
    lessonDao.addContentsAndDays(lesson);
  }
  
  @Override
  public void deleteContentsAndDays(int currLessonNo) throws Exception {
    lessonDao.deleteContentsAndDays(currLessonNo);
  }
  
  @Override
  public void delete(int no) throws Exception {
    if (lessonDao.findBy(no) == null)
      throw new Exception("해당 데이터가 없습니다.");
    lessonDao.delete(no);
  }

  @Override
  public Lesson lessonDetail(int lessonNo) throws Exception {
    return lessonDao.findCurrBy(lessonNo);

  }
}
