package com.ast.eom.domain;

import java.sql.Date;

public class DayLesson {
  private int dayLessonNo;
  private Date lessonDate;
  private int lessonStartHour;
  private int lessonEndHour;
  private String lessonSummary;
  private String lessonEvaluation;
  
  private Lesson lesson;
  
  @Override
  public String toString() {
    return "DayLesson [dayLessonNo=" + dayLessonNo + ", lessonDate=" + lessonDate + ", lessonStartHour="
        + lessonStartHour + ", lessonEndHour=" + lessonEndHour + ", lessonSummary=" + lessonSummary
        + ", lessonEvaluation=" + lessonEvaluation + ", lesson=" + lesson + "]";
  }
  public int getDayLessonNo() {
    return dayLessonNo;
  }
  public void setDayLessonNo(int dayLessonNo) {
    this.dayLessonNo = dayLessonNo;
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
  public String getLessonSummary() {
    return lessonSummary;
  }
  public void setLessonSummary(String lessonSummary) {
    this.lessonSummary = lessonSummary;
  }
  public String getLessonEvaluation() {
    return lessonEvaluation;
  }
  public void setLessonEvaluation(String lessonEvaluation) {
    this.lessonEvaluation = lessonEvaluation;
  }
  public Lesson getLesson() {
    return lesson;
  }
  public void setLesson(Lesson lesson) {
    this.lesson = lesson;
  }
}
