package com.ast.eom.domain;

import java.sql.Date;

public class WantedLesson {
  private int wantedLessonNo;
  private String requirements;
  private Date registeredDate;
  
  private Student student;
  private Subject subject;
  
  @Override
  public String toString() {
    return "WantedLesson [wantedLessonNo=" + wantedLessonNo + ", requirements=" + requirements + ", registeredDate="
        + registeredDate + ", student=" + student + ", subject=" + subject + "]";
  }
  public int getWantedLessonNo() {
    return wantedLessonNo;
  }
  public void setWantedLessonNo(int wantedLessonNo) {
    this.wantedLessonNo = wantedLessonNo;
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
  public Student getStudent() {
    return student;
  }
  public void setStudent(Student student) {
    this.student = student;
  }
  public Subject getSubject() {
    return subject;
  }
  public void setSubject(Subject subject) {
    this.subject = subject;
  }
}
