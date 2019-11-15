package com.ast.eom.domain;

import java.sql.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;

public class MemberTeacherStudent {

  private int memberNo;
  private int memberTypeNo;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date registeredDate;
  private String gender;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date dateOfBirth;
  private String name;
  private String addressCity;
  private String addressSuburb;
  private String profilePhoto;
  private String lessonDays;
  private String lessonStartTime;
  private String lessonEndTime;
  private int teacherAge;
  
  private String memberTypeName;
  
  private String teacherPhoto;

  private String schoolType;
  
  private String subjectName;
  
  private List<Teacher> teachers;
  private List<LessonSubject> lessonSubjects;
  private List<School> schools;
  private List<Lesson> lessons;
  private List<Student> students;
  
  public int getTeacherAge() {
    return teacherAge;
  }
  public void setTeacherAge(int teacherAge) {
    this.teacherAge = teacherAge;
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
  public Date getRegisteredDate() {
    return registeredDate;
  }
  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
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
  public String getLessonDays() {
    return lessonDays;
  }
  public void setLessonDays(String lessonDays) {
    this.lessonDays = lessonDays;
  }
  public String getLessonStartTime() {
    return lessonStartTime;
  }
  public void setLessonStartTime(String lessonStartTime) {
    this.lessonStartTime = lessonStartTime;
  }
  public String getLessonEndTime() {
    return lessonEndTime;
  }
  public void setLessonEndTime(String lessonEndTime) {
    this.lessonEndTime = lessonEndTime;
  }
  public String getMemberTypeName() {
    return memberTypeName;
  }
  public void setMemberTypeName(String memberTypeName) {
    this.memberTypeName = memberTypeName;
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
  public String getSubjectName() {
    return subjectName;
  }
  public void setSubjectName(String subjectName) {
    this.subjectName = subjectName;
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
  public List<Lesson> getLessons() {
    return lessons;
  }
  public void setLessons(List<Lesson> lessons) {
    this.lessons = lessons;
  }
  public List<Student> getStudents() {
    return students;
  }
  public void setStudents(List<Student> students) {
    this.students = students;
  }
  @Override
  public String toString() {
    return "MemberTeacherStudent [memberNo=" + memberNo + ", memberTypeNo=" + memberTypeNo
        + ", registeredDate=" + registeredDate + ", gender=" + gender + ", dateOfBirth="
        + dateOfBirth + ", name=" + name + ", addressCity=" + addressCity + ", addressSuburb="
        + addressSuburb + ", profilePhoto=" + profilePhoto + ", lessonDays=" + lessonDays
        + ", lessonStartTime=" + lessonStartTime + ", lessonEndTime=" + lessonEndTime
        + ", teacherAge=" + teacherAge + ", memberTypeName=" + memberTypeName + ", teacherPhoto="
        + teacherPhoto + ", schoolType=" + schoolType + ", subjectName=" + subjectName
        + ", teachers=" + teachers + ", lessonSubjects=" + lessonSubjects + ", schools=" + schools
        + ", lessons=" + lessons + ", students=" + students + "]";
  }
  
  
  
  
  
}
