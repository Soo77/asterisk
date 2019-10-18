package com.ast.eom.domain;

public class Student {
  private int studentNo;
  private Parents parents;
  private String schoolType;
  
  public int getStudentNo() {
    return studentNo;
  }
  public void setStudentNo(int studentNo) {
    this.studentNo = studentNo;
  }
  public Parents getParents() {
    return parents;
  }
  public void setParents(Parents parents) {
    this.parents = parents;
  }
  public String getSchoolType() {
    return schoolType;
  }
  public void setSchoolType(String schoolType) {
    this.schoolType = schoolType;
  }
  
}
