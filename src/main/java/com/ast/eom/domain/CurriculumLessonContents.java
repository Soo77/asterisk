package com.ast.eom.domain;

public class CurriculumLessonContents {
  private int curriculumLessonNo;
  private String lessonContents;
  private int lessonDays;
  
  private Curriculum curriculum;
  
  @Override
  public String toString() {
    return "CurriculumLessonContents [curriculumLessonNo=" + curriculumLessonNo + ", lessonContents=" + lessonContents
        + ", lessonDays=" + lessonDays + ", curriculum=" + curriculum + "]";
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
  public Curriculum getCurriculum() {
    return curriculum;
  }
  public void setCurriculum(Curriculum curriculum) {
    this.curriculum = curriculum;
  }
}
