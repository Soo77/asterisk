package com.ast.eom.domain;

import java.sql.Date;

public class LessonSubject {
  private int lessonSubjectNo;
  private Teacher teacher;
  private Subject subject;
  private String subjectContents;
  private Date registeredDate;
  private int wantedFee;
  
  public int getLessonSubjectNo() {
    return lessonSubjectNo;
  }
  public void setLessonSubjectNo(int lessonSubjectNo) {
    this.lessonSubjectNo = lessonSubjectNo;
  }
  public Teacher getTeacher() {
    return teacher;
  }
  public void setTeacher(Teacher teacher) {
    this.teacher = teacher;
  }
  public Subject getSubject() {
    return subject;
  }
  public void setSubject(Subject subject) {
    this.subject = subject;
  }
  public String getSubjectContents() {
    return subjectContents;
  }
  public void setSubjectContents(String subjectContents) {
    this.subjectContents = subjectContents;
  }
  public Date getRegisteredDate() {
    return registeredDate;
  }
  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }
  public int getWantedFee() {
    return wantedFee;
  }
  public void setWantedFee(int wantedFee) {
    this.wantedFee = wantedFee;
  }
  
}
