package com.ast.eom.domain;

import java.sql.Date;

public class LessonSubject {
  private int lessonSubjectNo;
  private int teacherNo;
  private int subjectNo;
  private String subjectContents;
  private Date registeredDate;
  private int wantedFee;
  
  @Override
  public String toString() {
    return "LessonSubject [lessonSubjectNo=" + lessonSubjectNo + ", teacherNo=" + teacherNo + ", subjectNo=" + subjectNo
        + ", subjectContents=" + subjectContents + ", registeredDate=" + registeredDate + ", wantedFee=" + wantedFee
        + "]";
  }
  public int getLessonSubjectNo() {
    return lessonSubjectNo;
  }
  public void setLessonSubjectNo(int lessonSubjectNo) {
    this.lessonSubjectNo = lessonSubjectNo;
  }
  public int getTeacherNo() {
    return teacherNo;
  }
  public void setTeacherNo(int teacherNo) {
    this.teacherNo = teacherNo;
  }
  public int getSubjectNo() {
    return subjectNo;
  }
  public void setSubjectNo(int subjectNo) {
    this.subjectNo = subjectNo;
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
