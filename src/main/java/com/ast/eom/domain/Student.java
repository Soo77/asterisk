package com.ast.eom.domain;

import java.util.List;

public class Student extends Member {
  private int studentNo;
  private int parentsNo;
  
  private SchoolType schoolType;

  private List<Lesson> lessons;
  private List<WantedLesson> wantedLessons;
  private List<School> schools;
  private List<LessonSubject> lessonSubjects;
  
  @Override
  public String toString() {
    return "Student [studentNo=" + studentNo + ", parentsNo=" + parentsNo + ", schoolType=" + schoolType + ", lessons="
        + lessons + ", wantedLessons=" + wantedLessons + ", schools=" + schools + ", lessonSubjects=" + lessonSubjects
        + "]";
  }
  public int getStudentNo() {
    return studentNo;
  }
  public void setStudentNo(int studentNo) {
    this.studentNo = studentNo;
  }
  public int getParentsNo() {
    return parentsNo;
  }
  public void setParentsNo(int parentsNo) {
    this.parentsNo = parentsNo;
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
  public List<School> getSchools() {
    return schools;
  }
  public void setSchools(List<School> schools) {
    this.schools = schools;
  }
  public List<LessonSubject> getLessonSubjects() {
    return lessonSubjects;
  }
  public void setLessonSubjects(List<LessonSubject> lessonSubjects) {
    this.lessonSubjects = lessonSubjects;
  }
}
