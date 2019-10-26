package com.ast.eom.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class WantedLesson {
  private int wantedLessonNo;
  private int studentNo;
  private int subjectNo;
  private String requirements;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date registeredDate;
  
  @Override
  public String toString() {
    return "WantedLesson [wantedLessonNo=" + wantedLessonNo + ", studentNo=" + studentNo + ", subjectNo=" + subjectNo
        + ", requirements=" + requirements + ", registeredDate=" + registeredDate + "]";
  }
  public int getWantedLessonNo() {
    return wantedLessonNo;
  }
  public void setWantedLessonNo(int wantedLessonNo) {
    this.wantedLessonNo = wantedLessonNo;
  }
  public int getStudentNo() {
    return studentNo;
  }
  public void setStudentNo(int studentNo) {
    this.studentNo = studentNo;
  }
  public int getSubjectNo() {
    return subjectNo;
  }
  public void setSubjectNo(int subjectNo) {
    this.subjectNo = subjectNo;
  }
  public String getRequirements() {
    return requirements;
  }
  public void setRequirements(String requirements) {
    this.requirements = requirements;
  }
  public Date getRegisteredDate() {
    return registeredDate;
  }
  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }
}
