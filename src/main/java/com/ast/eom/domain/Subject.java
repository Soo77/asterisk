package com.ast.eom.domain;

public class Subject {
  private int subjectNo;
  private String subjectName;
  
  private SchoolType schoolType;

  @Override
  public String toString() {
    return "Subject [subjectNo=" + subjectNo + ", subjectName=" + subjectName + ", schoolType=" + schoolType + "]";
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
}
