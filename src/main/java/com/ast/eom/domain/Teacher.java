package com.ast.eom.domain;

import java.util.List;

public class Teacher {
  private int teacherNo;
  private String accountNo;
  private String bankName;
  private String lessonCertificate;
  private String teacherIntro;
  private boolean approvementState;
  private String videoAddress;
  
  private List<Lesson> lessons;
  private List<School> schools;
  private List<LessonSubject> lessonSubjects;
  private List<Teacher> teachers;
  private List<TeacherPhoto> teacherPhotos;
  
  @Override
  public String toString() {
    return "Teacher [teacherNo=" + teacherNo + ", accountNo=" + accountNo + ", bankName=" + bankName
        + ", lessonCertificate=" + lessonCertificate + ", teacherIntro=" + teacherIntro + ", approvementState="
        + approvementState + ", videoAddress=" + videoAddress + ", lessons=" + lessons + ", schools=" + schools
        + ", lessonSubjects=" + lessonSubjects + ", teachers=" + teachers + ", teacherPhotos=" + teacherPhotos + "]";
  }
  public int getTeacherNo() {
    return teacherNo;
  }
  public void setTeacherNo(int teacherNo) {
    this.teacherNo = teacherNo;
  }
  public String getAccountNo() {
    return accountNo;
  }
  public void setAccountNo(String accountNo) {
    this.accountNo = accountNo;
  }
  public String getBankName() {
    return bankName;
  }
  public void setBankName(String bankName) {
    this.bankName = bankName;
  }
  public String getLessonCertificate() {
    return lessonCertificate;
  }
  public void setLessonCertificate(String lessonCertificate) {
    this.lessonCertificate = lessonCertificate;
  }
  public String getTeacherIntro() {
    return teacherIntro;
  }
  public void setTeacherIntro(String teacherIntro) {
    this.teacherIntro = teacherIntro;
  }
  public boolean isApprovementState() {
    return approvementState;
  }
  public void setApprovementState(boolean approvementState) {
    this.approvementState = approvementState;
  }
  public String getVideoAddress() {
    return videoAddress;
  }
  public void setVideoAddress(String videoAddress) {
    this.videoAddress = videoAddress;
  }
  public List<Lesson> getLessons() {
    return lessons;
  }
  public void setLessons(List<Lesson> lessons) {
    this.lessons = lessons;
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
  public List<Teacher> getTeachers() {
    return teachers;
  }
  public void setTeachers(List<Teacher> teachers) {
    this.teachers = teachers;
  }
  public List<TeacherPhoto> getTeacherPhotos() {
    return teacherPhotos;
  }
  public void setTeacherPhotos(List<TeacherPhoto> teacherPhotos) {
    this.teacherPhotos = teacherPhotos;
  }
}
