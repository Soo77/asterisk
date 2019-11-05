package com.ast.eom.domain;

import java.util.List;

public class Curriculum {
  private int lessonNo;
  private String currentLessonDay;
  private String currentLessonStartTime;
  private String currentLessonEndTime;
  private int totalHours;
  
  private List<CurriculumLessonContents> curriculumLessonContents;
  

  @Override
  public String toString() {
    return "Curriculum [lessonNo=" + lessonNo + ", currentLessonDay=" + currentLessonDay
        + ", currentLessonStartTime=" + currentLessonStartTime + ", currentLessonEndTime="
        + currentLessonEndTime + ", totalHours=" + totalHours + ", curriculumLessonContents="
        + curriculumLessonContents + "]";
  }
  public String getCurrentLessonDay() {
    return currentLessonDay;
  }
  public void setCurrentLessonDay(String currentLessonDay) {
    this.currentLessonDay = currentLessonDay;
  }

  public String getCurrentLessonStartTime() {
    return currentLessonStartTime;
  }
  public void setCurrentLessonStartTime(String currentLessonStartTime) {
    this.currentLessonStartTime = currentLessonStartTime;
  }
  public String getCurrentLessonEndTime() {
    return currentLessonEndTime;
  }
  public void setCurrentLessonEndTime(String currentLessonEndTime) {
    this.currentLessonEndTime = currentLessonEndTime;
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
