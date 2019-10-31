package com.ast.eom.domain;

import java.util.List;

public class MemberTeacherStudent {

  private int memberNo;
  private int memberTypeNo;
  private String gender;
  private String name;
  private String addressCity;
  private String addressSuburb;
  private String teacherPhoto;

  private String schoolType;
  
  private List<School> schools;
  private List<Subject> subjects;
  
  
  @Override
  public String toString() {
    return "MemberTeacherStudent [memberNo=" + memberNo + ", memberTypeNo=" + memberTypeNo
        + ", gender=" + gender + ", name=" + name + ", addressCity=" + addressCity
        + ", addressSuburb=" + addressSuburb + ", teacherPhoto=" + teacherPhoto + ", schoolType="
        + schoolType + ", schools=" + schools + ", subjects=" + subjects + "]";
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public int getMemberTypeNo() {
    return memberTypeNo;
  }
  public void setMemberTypeNo(int memberTypeNo) {
    this.memberTypeNo = memberTypeNo;
  }
  public String getGender() {
    return gender;
  }
  public void setGender(String gender) {
    this.gender = gender;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getAddressCity() {
    return addressCity;
  }
  public void setAddressCity(String addressCity) {
    this.addressCity = addressCity;
  }
  public String getAddressSuburb() {
    return addressSuburb;
  }
  public void setAddressSuburb(String addressSuburb) {
    this.addressSuburb = addressSuburb;
  }
  public String getTeacherPhoto() {
    return teacherPhoto;
  }
  public void setTeacherPhoto(String teacherPhoto) {
    this.teacherPhoto = teacherPhoto;
  }
  public String getSchoolType() {
    return schoolType;
  }
  public void setSchoolType(String schoolType) {
    this.schoolType = schoolType;
  }
  public List<School> getSchools() {
    return schools;
  }
  public void setSchools(List<School> schools) {
    this.schools = schools;
  }
  public List<Subject> getSubjects() {
    return subjects;
  }
  public void setSubjects(List<Subject> subjects) {
    this.subjects = subjects;
  }
}
