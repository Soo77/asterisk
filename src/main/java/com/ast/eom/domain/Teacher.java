package com.ast.eom.domain;

public class Teacher {
  private int teacherNo;
  private String accountNo;
  private String bankNo;
  private String lessonCertificate;
  private String teacherIntro;
  private boolean approvementState;
  private String videoAddress;
  
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
  public String getBankNo() {
    return bankNo;
  }
  public void setBankNo(String bankNo) {
    this.bankNo = bankNo;
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
  
}
