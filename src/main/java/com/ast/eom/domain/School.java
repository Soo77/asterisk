package com.ast.eom.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class School {
  private int schoolNo;
  private int teacherNo;
  private String schoolName;
  private String certificate;
  private boolean graduated;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date modifiedDate;
  private String major;
  private boolean confirmed;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date graduatedDate;
  
  private SchoolType schoolType;
  private int schoolTypeNo;
  
  
  @Override
  public String toString() {
    return "School [schoolNo=" + schoolNo + ", teacherNo=" + teacherNo + ", schoolName="
        + schoolName + ", certificate=" + certificate + ", graduated=" + graduated
        + ", modifiedDate=" + modifiedDate + ", major=" + major + ", confirmed=" + confirmed
        + ", graduatedDate=" + graduatedDate + ", schoolType=" + schoolType + ", schoolTypeNo="
        + schoolTypeNo + "]";
  }
  public int getSchoolNo() {
    return schoolNo;
  }
  public void setSchoolNo(int schoolNo) {
    this.schoolNo = schoolNo;
  }
  public int getTeacherNo() {
    return teacherNo;
  }
  public void setTeacherNo(int teacherNo) {
    this.teacherNo = teacherNo;
  }
  public String getSchoolName() {
    return schoolName;
  }
  public void setSchoolName(String schoolName) {
    this.schoolName = schoolName;
  }
  public String getCertificate() {
    return certificate;
  }
  public void setCertificate(String certificate) {
    this.certificate = certificate;
  }
  public boolean isGraduated() {
    return graduated;
  }
  public void setGraduated(boolean graduated) {
    this.graduated = graduated;
  }
  public Date getModifiedDate() {
    return modifiedDate;
  }
  public void setModifiedDate(Date modifiedDate) {
    this.modifiedDate = modifiedDate;
  }
  public String getMajor() {
    return major;
  }
  public void setMajor(String major) {
    this.major = major;
  }
  public boolean isConfirmed() {
    return confirmed;
  }
  public void setConfirmed(boolean confirmed) {
    this.confirmed = confirmed;
  }
  public Date getGraduatedDate() {
    return graduatedDate;
  }
  public void setGraduatedDate(Date graduatedDate) {
    this.graduatedDate = graduatedDate;
  }
  public SchoolType getSchoolType() {
    return schoolType;
  }
  public void setSchoolType(SchoolType schoolType) {
    this.schoolType = schoolType;
  }
  public int getSchoolTypeNo() {
    return schoolTypeNo;
  }
  public void setSchoolTypeNo(int schoolTypeNo) {
    this.schoolTypeNo = schoolTypeNo;
  }
}
