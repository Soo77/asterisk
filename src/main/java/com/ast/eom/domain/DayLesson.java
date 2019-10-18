package com.ast.eom.domain;

import java.sql.Date;

public class DayLesson {
  private int dayLessonNo;
  private Curriculum curriculum;
  private Date lessonDate;
  private int lessonStartHour;
  private int lessonEndHour;
  private String lessonRevision;
  private String lessonEvaluation;
  
  public int getDayLessonNo() {
    return dayLessonNo;
  }
  public void setDayLessonNo(int dayLessonNo) {
    this.dayLessonNo = dayLessonNo;
  }
  public Curriculum getCurriculum() {
    return curriculum;
  }
  public void setCurriculum(Curriculum curriculum) {
    this.curriculum = curriculum;
  }
  public Date getLessonDate() {
    return lessonDate;
  }
  public void setLessonDate(Date lessonDate) {
    this.lessonDate = lessonDate;
  }
  public int getLessonStartHour() {
    return lessonStartHour;
  }
  public void setLessonStartHour(int lessonStartHour) {
    this.lessonStartHour = lessonStartHour;
  }
  public int getLessonEndHour() {
    return lessonEndHour;
  }
  public void setLessonEndHour(int lessonEndHour) {
    this.lessonEndHour = lessonEndHour;
  }
  public String getLessonRevision() {
    return lessonRevision;
  }
  public void setLessonRevision(String lessonRevision) {
    this.lessonRevision = lessonRevision;
  }
  public String getLessonEvaluation() {
    return lessonEvaluation;
  }
  public void setLessonEvaluation(String lessonEvaluation) {
    this.lessonEvaluation = lessonEvaluation;
  }
  
}
