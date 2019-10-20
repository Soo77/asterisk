package com.ast.eom.domain;

public class Student {
  private int studentNo;
  
  private Parents parents;
  private SchoolType schoolType;
  
  @Override
  public String toString() {
    return "Student [studentNo=" + studentNo + ", parents=" + parents + ", schoolType=" + schoolType + "]";
  }
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
  public SchoolType getSchoolType() {
    return schoolType;
  }
  public void setSchoolType(SchoolType schoolType) {
    this.schoolType = schoolType;
  }
}
