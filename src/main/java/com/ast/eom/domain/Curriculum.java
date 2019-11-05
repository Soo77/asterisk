package com.ast.eom.domain;

import java.util.List;

public class Curriculum {
  private int lessonNo;
  private String curriculumLessonDay;
  private String curriculumLessonStartTime;
  private String curriculumLessonEndTime;
  private int totalHours;
  
  private List<CurriculumLessonContents> curriculumLessonContents;
  
  @Override
  public String toString() {
    return "Curriculum [lessonNo=" + lessonNo + ", curriculumLessonDay=" + curriculumLessonDay
        + ", curriculumLessonStartTime=" + curriculumLessonStartTime + ", curriculumLessonEndTime="
        + curriculumLessonEndTime + ", totalHours=" + totalHours + ", curriculumLessonContents="
        + curriculumLessonContents + "]";
  }
  public String getCurriculumLessonDay() {
    return curriculumLessonDay;
  }
  public void setCurriculumLessonDay(String curriculumLessonDay) {
    this.curriculumLessonDay = curriculumLessonDay;
  }
  public String getCurriculumLessonStartTime() {
    return curriculumLessonStartTime;
  }
  public void setCurriculumLessonStartTime(String curriculumLessonStartTime) {
    this.curriculumLessonStartTime = curriculumLessonStartTime;
  }
  public String getCurriculumLessonEndTime() {
    return curriculumLessonEndTime;
  }
  public void setCurriculumLessonEndTime(String curriculumLessonEndTime) {
    this.curriculumLessonEndTime = curriculumLessonEndTime;
  }
  public int getLessonNo() {
    return lessonNo;
  }
  public void setLessonNo(int lessonNo) {
    this.lessonNo = lessonNo;
  }
  public int getTotalHours() {
    return totalHours;
  }
  public void setTotalHours(int totalHours) {
    this.totalHours = totalHours;
  }
  public List<CurriculumLessonContents> getCurriculumLessonContents() {
    return curriculumLessonContents;
  }
  public void setCurriculumLessonContents(List<CurriculumLessonContents> curriculumLessonContents) {
    this.curriculumLessonContents = curriculumLessonContents;
  }
}
