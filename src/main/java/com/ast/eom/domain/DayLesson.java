package com.ast.eom.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DayLesson {
  private int dayLessonNo;
  private int lessonNo;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date lessonDate;
  private String lessonDateStr;
  private String lessonStartHour;
  private String lessonEndHour;
  private String lessonSummary;
  private String lessonEvaluation;
  
  @Override
  public String toString() {
    return "DayLesson [dayLessonNo=" + dayLessonNo + ", lessonNo=" + lessonNo + ", lessonDate="
        + lessonDate + ", lessonDateStr=" + lessonDateStr + ", lessonStartHour=" + lessonStartHour
        + ", lessonEndHour=" + lessonEndHour + ", lessonSummary=" + lessonSummary
        + ", lessonEvaluation=" + lessonEvaluation + "]";
  }
  public String getLessonDateStr() {
    return lessonDateStr;
  }
  public void setLessonDateStr(String lessonDateStr) {
    this.lessonDateStr = lessonDateStr;
  }
  public int getDayLessonNo() {
    return dayLessonNo;
  }
  public void setDayLessonNo(int dayLessonNo) {
    this.dayLessonNo = dayLessonNo;
  }
  public int getLessonNo() {
    return lessonNo;
  }
  public void setLessonNo(int lessonNo) {
    this.lessonNo = lessonNo;
  }
  public Date getLessonDate() {
    return lessonDate;
  }
  public void setLessonDate(Date lessonDate) {
    this.lessonDate = lessonDate;
  }
  public String getLessonStartHour() {
    return lessonStartHour;
  }
  public void setLessonStartHour(String lessonStartHour) {
    this.lessonStartHour = lessonStartHour;
  }
  public String getLessonEndHour() {
    return lessonEndHour;
  }
  public void setLessonEndHour(String lessonEndHour) {
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
}
