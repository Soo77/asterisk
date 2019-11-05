package com.ast.eom.domain;

public class CurriculumLessonContents {
  private int curriculumLessonNo;
  private int lessonNo;
  private String lessonContents;
  private int lessonDays;
  


  @Override
  public String toString() {
    return "CurriculumLessonContents [curriculumLessonNo=" + curriculumLessonNo + ", lessonNo="
        + lessonNo + ", lessonContents=" + lessonContents + ", lessonDays=" + lessonDays + "]";
  }
  public int getCurriculumLessonNo() {
    return curriculumLessonNo;
  }
  public void setCurriculumLessonNo(int curriculumLessonNo) {
    this.curriculumLessonNo = curriculumLessonNo;
  }
  public String getLessonContents() {
    return lessonContents;
  }
  public void setLessonContents(String lessonContents) {
    this.lessonContents = lessonContents;
  }
  public int getLessonDays() {
    return lessonDays;
  }
  public void setLessonDays(int lessonDays) {
    this.lessonDays = lessonDays;
  }
  public int getLessonNo() {
    return lessonNo;
  }
  public void setLessonNo(int lessonNo) {
    this.lessonNo = lessonNo;
  }
  
}
