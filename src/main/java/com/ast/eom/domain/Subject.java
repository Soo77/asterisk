package com.ast.eom.domain;

import java.util.List;

public class Subject {
  private int subjectNo;
  private String subjectName;
  private int schoolTypeNo;
  
  private SchoolType schoolType;

  private List<Lesson> lessons;
  private List<WantedLesson> wantedLessons;
  private List<LessonSubject> lessonSubjects;
  
  @Override
  public String toString() {
    return "Subject [subjectNo=" + subjectNo + ", subjectName=" + subjectName + ", schoolTypeNo="
        + schoolTypeNo + ", schoolType=" + schoolType + ", lessons=" + lessons + ", wantedLessons="
        + wantedLessons + ", lessonSubjects=" + lessonSubjects + "]";
  }
  public int getSubjectNo() {
    return subjectNo;
  }
  public void setSubjectNo(int subjectNo) {
    this.subjectNo = subjectNo;
  }
  public String getSubjectName() {
    return subjectName;
  }
  public void setSubjectName(String subjectName) {
    this.subjectName = subjectName;
  }
  public SchoolType getSchoolType() {
    return schoolType;
  }
  public void setSchoolType(SchoolType schoolType) {
    this.schoolType = schoolType;
  }
  public List<Lesson> getLessons() {
    return lessons;
  }
  public void setLessons(List<Lesson> lessons) {
    this.lessons = lessons;
  }
  public List<WantedLesson> getWantedLessons() {
    return wantedLessons;
  }
  public void setWantedLessons(List<WantedLesson> wantedLessons) {
    this.wantedLessons = wantedLessons;
  }
  public List<LessonSubject> getLessonSubjects() {
    return lessonSubjects;
  }
  public void setLessonSubjects(List<LessonSubject> lessonSubjects) {
    this.lessonSubjects = lessonSubjects;
  }
  public int getSchoolTypeNo() {
    return schoolTypeNo;
  }
  public void setSchoolTypeNo(int schoolTypeNo) {
    this.schoolTypeNo = schoolTypeNo;
  }
}
