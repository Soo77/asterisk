package com.ast.eom.domain;

public class CurriculumLessonContents {
  private int curriculumLessonNo;
  private int curriculumNo;
  private String lessonContents;
  private int lessonDays;
  
  @Override
  public String toString() {
    return "CurriculumLessonContents [curriculumLessonNo=" + curriculumLessonNo + ", curriculumNo=" + curriculumNo
        + ", lessonContents=" + lessonContents + ", lessonDays=" + lessonDays + "]";
  }
  public int getCurriculumLessonNo() {
    return curriculumLessonNo;
  }
  public void setCurriculumLessonNo(int curriculumLessonNo) {
    this.curriculumLessonNo = curriculumLessonNo;
  }
  public int getCurriculumNo() {
    return curriculumNo;
  }
  public void setCurriculumNo(int curriculumNo) {
    this.curriculumNo = curriculumNo;
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
}
