package com.ast.eom.domain;

public class SchoolType {
  private int schoolTypeNo;
  private String schoolType;
  
  @Override
  public String toString() {
    return "SchoolType [schoolTypeNo=" + schoolTypeNo + ", schoolType=" + schoolType + "]";
  }
  public int getSchoolTypeNo() {
    return schoolTypeNo;
  }
  public void setSchoolTypeNo(int schoolTypeNo) {
    this.schoolTypeNo = schoolTypeNo;
  }
  public String getSchoolType() {
    return schoolType;
  }
  public void setSchoolType(String schoolType) {
    this.schoolType = schoolType;
  }
}
