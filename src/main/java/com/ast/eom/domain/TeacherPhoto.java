package com.ast.eom.domain;

public class TeacherPhoto {
  private int teacherPhotoNo;
  private Teacher teacher;
  private String teacherPhoto;
  
  public int getTeacherPhotoNo() {
    return teacherPhotoNo;
  }
  public void setTeacherPhotoNo(int teacherPhotoNo) {
    this.teacherPhotoNo = teacherPhotoNo;
  }
  public Teacher getTeacher() {
    return teacher;
  }
  public void setTeacher(Teacher teacher) {
    this.teacher = teacher;
  }
  public String getTeacherPhoto() {
    return teacherPhoto;
  }
  public void setTeacherPhoto(String teacherPhoto) {
    this.teacherPhoto = teacherPhoto;
  }
  
}
