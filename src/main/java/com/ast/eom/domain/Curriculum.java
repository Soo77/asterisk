package com.ast.eom.domain;

import java.util.List;

public class Curriculum {
  private int curriculumNo;
  private int lessonNo;
  private int totalHours;
  
  private List<CurriculumLessonContents> curriculumLessonContents;

  @Override
  public String toString() {
    return "Curriculum [curriculumNo=" + curriculumNo + ", lessonNo=" + lessonNo + ", totalHours=" + totalHours
        + ", curriculumLessonContents=" + curriculumLessonContents + "]";
  }
  public int getCurriculumNo() {
    return curriculumNo;
  }
  public void setCurriculumNo(int curriculumNo) {
    this.curriculumNo = curriculumNo;
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
