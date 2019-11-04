package com.ast.eom.domain;

import java.sql.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;

public class MemberTeacherStudent {

  private int memberNo;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date registeredDate;
  private int memberTypeNo;
  private String gender;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date dateOfBirth;
  private String name;
  private String addressCity;
  private String addressSuburb;
  private String profilePhoto;
  private String teacherPhoto;

  private String schoolType;
  
  private List<Teacher> teachers;
  private List<LessonSubject> lessonSubjects;
  private List<School> schools;
  private List<Subject> subjects;
  
  
  @Override
  public String toString() {
    return "MemberTeacherStudent [memberNo=" + memberNo + ", registeredDate=" + registeredDate
        + ", memberTypeNo=" + memberTypeNo + ", gender=" + gender + ", dateOfBirth=" + dateOfBirth
        + ", name=" + name + ", addressCity=" + addressCity + ", addressSuburb=" + addressSuburb
        + ", profilePhoto=" + profilePhoto + ", teacherPhoto=" + teacherPhoto + ", schoolType="
        + schoolType + ", teachers=" + teachers + ", lessonSubjects=" + lessonSubjects
        + ", schools=" + schools + ", subjects=" + subjects + "]";
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public Date getRegisteredDate() {
    return registeredDate;
  }
  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
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
  public Date getDateOfBirth() {
    return dateOfBirth;
  }
  public void setDateOfBirth(Date dateOfBirth) {
    this.dateOfBirth = dateOfBirth;
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
  public String getProfilePhoto() {
    return profilePhoto;
  }
  public void setProfilePhoto(String profilePhoto) {
    this.profilePhoto = profilePhoto;
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
  public List<Teacher> getTeachers() {
    return teachers;
  }
  public void setTeachers(List<Teacher> teachers) {
    this.teachers = teachers;
  }
  public List<LessonSubject> getLessonSubjects() {
    return lessonSubjects;
  }
  public void setLessonSubjects(List<LessonSubject> lessonSubjects) {
    this.lessonSubjects = lessonSubjects;
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
