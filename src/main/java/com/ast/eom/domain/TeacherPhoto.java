package com.ast.eom.domain;

public class TeacherPhoto {
  private int teacherPhotoNo;
  private int teacherNo;
  private String teacherPhoto;
  
  @Override
  public String toString() {
    return "TeacherPhoto [teacherPhotoNo=" + teacherPhotoNo + ", teacherNo=" + teacherNo + ", teacherPhoto="
        + teacherPhoto + "]";
  }
  public int getTeacherPhotoNo() {
    return teacherPhotoNo;
  }
  public void setTeacherPhotoNo(int teacherPhotoNo) {
    this.teacherPhotoNo = teacherPhotoNo;
  }
  public int getTeacherNo() {
    return teacherNo;
  }
  public void setTeacherNo(int teacherNo) {
    this.teacherNo = teacherNo;
  }
  public String getTeacherPhoto() {
    return teacherPhoto;
  }
  public void setTeacherPhoto(String teacherPhoto) {
    this.teacherPhoto = teacherPhoto;
  }
}
