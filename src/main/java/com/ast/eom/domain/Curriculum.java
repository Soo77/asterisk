package com.ast.eom.domain;

import java.sql.Date;

public class Curriculum {
  private int curriculumNo;
  private Lesson lesson;
  private int orderNo;
  private String lessonContents;
  private Date lessonDate;
  private int totalHours;
  
  public int getCurriculumNo() {
    return curriculumNo;
  }
  public void setCurriculumNo(int curriculumNo) {
    this.curriculumNo = curriculumNo;
  }
  public Lesson getLesson() {
    return lesson;
  }
  public void setLesson(Lesson lesson) {
    this.lesson = lesson;
  }
  public int getOrderNo() {
    return orderNo;
  }
  public void setOrderNo(int orderNo) {
    this.orderNo = orderNo;
  }
  public String getLessonContents() {
    return lessonContents;
  }
  public void setLessonContents(String lessonContents) {
    this.lessonContents = lessonContents;
  }
  public Date getLessonDate() {
    return lessonDate;
  }
  public void setLessonDate(Date lessonDate) {
    this.lessonDate = lessonDate;
  }
  public int getTotalHours() {
    return totalHours;
  }
  public void setTotalHours(int totalHours) {
    this.totalHours = totalHours;
  }
  
}
