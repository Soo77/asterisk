package com.ast.eom.domain;

public class Curriculum {
  private int curriculumNo;
  private int totalHours;
  
  private Lesson lesson;
  
  @Override
  public String toString() {
    return "Curriculum [curriculumNo=" + curriculumNo + ", totalHours=" + totalHours + ", lesson=" + lesson + "]";
  }
  public int getCurriculumNo() {
    return curriculumNo;
  }
  public void setCurriculumNo(int curriculumNo) {
    this.curriculumNo = curriculumNo;
  }
  public int getTotalHours() {
    return totalHours;
  }
  public void setTotalHours(int totalHours) {
    this.totalHours = totalHours;
  }
  public Lesson getLesson() {
    return lesson;
  }
  public void setLesson(Lesson lesson) {
    this.lesson = lesson;
  }
}
