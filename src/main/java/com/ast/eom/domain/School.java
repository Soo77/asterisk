package com.ast.eom.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class School {
  private int schoolNo;
  private int teacherNo;
  private String schoolName;
  private String certificate;
  private boolean isGraduated;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date modifiedDate;
  private String major;
  private boolean isConfirmed;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date graduatedDate;
  
  private SchoolType schoolType;
  
  @Override
  public String toString() {
    return "School [schoolNo=" + schoolNo + ", teacherNo=" + teacherNo + ", schoolName=" + schoolName + ", certificate="
        + certificate + ", isGraduated=" + isGraduated + ", modifiedDate=" + modifiedDate + ", major=" + major
        + ", isConfirmed=" + isConfirmed + ", graduatedDate=" + graduatedDate + ", schoolType=" + schoolType + "]";
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
    return isGraduated;
  }
  public void setGraduated(boolean isGraduated) {
    this.isGraduated = isGraduated;
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
    return isConfirmed;
  }
  public void setConfirmed(boolean isConfirmed) {
    this.isConfirmed = isConfirmed;
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
}
