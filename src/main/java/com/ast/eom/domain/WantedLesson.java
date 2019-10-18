package com.ast.eom.domain;

import java.sql.Date;

public class WantedLesson {
  private int wantedLessonNo;
  private Student student;
  private Subject subject;
  private String requirement;
  private Date registeredDate;
  
  public int getWantedLessonNo() {
    return wantedLessonNo;
  }
  public void setWantedLessonNo(int wantedLessonNo) {
    this.wantedLessonNo = wantedLessonNo;
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
  public String getRequirement() {
    return requirement;
  }
  public void setRequirement(String requirement) {
    this.requirement = requirement;
  }
  public Date getRegisteredDate() {
    return registeredDate;
  }
  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }
  
}
