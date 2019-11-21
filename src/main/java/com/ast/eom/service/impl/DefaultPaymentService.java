package com.ast.eom.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ast.eom.dao.AdminDao;
import com.ast.eom.dao.LessonDao;
import com.ast.eom.dao.MypageDao;
import com.ast.eom.domain.DayLesson;
import com.ast.eom.domain.Lesson;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Teacher;
import com.ast.eom.service.PaymentService;

@Service
public class DefaultPaymentService implements PaymentService {
  
  @Autowired
  AdminDao adminDao;
  @Autowired
  MypageDao mypageDao;
  @Autowired
  LessonDao lessonDao;
  
  HttpSession session;
  Lesson lesson;
  
  public DefaultPaymentService(HttpSession session) {
    this.session = session;
  }
  
  @Override
  public Map<String, Object> prepareTeacherInfoMapWith() throws Exception {
    Map<String, Object> teacherInfoMap = new HashMap<>();
    
    Lesson lesson = (Lesson) session.getAttribute("lessonInfoForPayment");
    this.lesson = lesson;
    Member member = adminDao.getMember(lesson.getTeacherNo());
    Teacher teacher = mypageDao.getTeacher(lesson.getTeacherNo());
    
    teacherInfoMap.put("member", member);
    teacherInfoMap.put("teacher", teacher);
    
    return teacherInfoMap;
  }
  
  @Override
  public void updatePaymentInfo() throws Exception {
    Map<String, Object> lessonParams = new HashMap<>();
    lessonParams.put("lessonNo", lesson.getLessonNo());
    lessonParams.put("lessonState", 1);
    
    List<DayLesson> dayLessons = lessonDao.getDayLessons(lesson.getLessonNo());
    if (dayLessons != null)
      lessonParams.put("lessonStartDate", lesson.getStartDate());
    
    lessonDao.updateLessonStateAndPaymentState(lessonParams);
  }
}
