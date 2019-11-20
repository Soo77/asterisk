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
  private String id;
  private String addressCity;
  private String addressSuburb;
  private String profilePhoto;
  private String lessonDays;
  private String lessonStartTime;
  private String lessonEndTime;
  private int teacherAge;
  
  private String memberTypeName;
  
  private String schoolType;
  
  private String subjectName;
  
  private List<TeacherPhoto> teacherPhotos;
  private List<Teacher> teachers;
  private List<LessonSubject> lessonSubjects;
  private List<School> schools;
  private List<Lesson> lessons;
  private List<Student> students;
  
  private String mySido;
  private String myGugun;
  private String myGender;
  private String myAge;
  private String myWantedFee;
  private String mySchool;
  private String mySubject;
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
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
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
  public int getTeacherAge() {
    return teacherAge;
  }
  public void setTeacherAge(int teacherAge) {
    this.teacherAge = teacherAge;
  }
  public String getMemberTypeName() {
    return memberTypeName;
  }
  public void setMemberTypeName(String memberTypeName) {
    this.memberTypeName = memberTypeName;
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
  public List<TeacherPhoto> getTeacherPhotos() {
    return teacherPhotos;
  }
  public void setTeacherPhotos(List<TeacherPhoto> teacherPhotos) {
    this.teacherPhotos = teacherPhotos;
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
  public String getMySido() {
    return mySido;
  }
  public void setMySido(String mySido) {
    this.mySido = mySido;
  }
  public String getMyGugun() {
    return myGugun;
  }
  public void setMyGugun(String myGugun) {
    this.myGugun = myGugun;
  }
  public String getMyGender() {
    return myGender;
  }
  public void setMyGender(String myGender) {
    this.myGender = myGender;
  }
  public String getMyAge() {
    return myAge;
  }
  public void setMyAge(String myAge) {
    this.myAge = myAge;
  }
  public String getMyWantedFee() {
    return myWantedFee;
  }
  public void setMyWantedFee(String myWantedFee) {
    this.myWantedFee = myWantedFee;
  }
  public String getMySchool() {
    return mySchool;
  }
  public void setMySchool(String mySchool) {
    this.mySchool = mySchool;
  }
  public String getMySubject() {
    return mySubject;
  }
  public void setMySubject(String mySubject) {
    this.mySubject = mySubject;
  }
  @Override
  public String toString() {
    return "MemberTeacherStudent [memberNo=" + memberNo + ", memberTypeNo=" + memberTypeNo
        + ", registeredDate=" + registeredDate + ", gender=" + gender + ", dateOfBirth="
        + dateOfBirth + ", id=" + id + ", addressCity=" + addressCity + ", addressSuburb="
        + addressSuburb + ", profilePhoto=" + profilePhoto + ", lessonDays=" + lessonDays
        + ", lessonStartTime=" + lessonStartTime + ", lessonEndTime=" + lessonEndTime
        + ", teacherAge=" + teacherAge + ", memberTypeName=" + memberTypeName + ", schoolType="
        + schoolType + ", subjectName=" + subjectName + ", teacherPhotos=" + teacherPhotos
        + ", teachers=" + teachers + ", lessonSubjects=" + lessonSubjects + ", schools=" + schools
        + ", lessons=" + lessons + ", students=" + students + ", mySido=" + mySido + ", myGugun="
        + myGugun + ", myGender=" + myGender + ", myAge=" + myAge + ", myWantedFee=" + myWantedFee
        + ", mySchool=" + mySchool + ", mySubject=" + mySubject + "]";
  }
  
 
  
  
  
  
  
  
  
}
