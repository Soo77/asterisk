package com.ast.eom.domain;

public class TeacherPhoto {
  private int teacherPhotoNo;

  private Teacher teacher;
  private TeacherPhoto teacherPhoto;
  
  @Override
  public String toString() {
    return "TeacherPhoto [teacherPhotoNo=" + teacherPhotoNo + ", teacher=" + teacher + ", teacherPhoto=" + teacherPhoto
        + "]";
  }
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
  public TeacherPhoto getTeacherPhoto() {
    return teacherPhoto;
  }
  public void setTeacherPhoto(TeacherPhoto teacherPhoto) {
    this.teacherPhoto = teacherPhoto;
  }
}
