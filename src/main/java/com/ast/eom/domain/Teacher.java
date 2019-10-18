package com.ast.eom.domain;

public class Teacher {

    int no;
    String account;
    String bankName;
    String lessonCertification;
    String teacherIntroduce;
    Boolean approvalStatus;
    String videoAddress;
    
    public int getNo() {
      return no;
    }
    public void setNo(int no) {
      this.no = no;
    }
    public String getAccount() {
      return account;
    }
    public void setAccount(String account) {
      this.account = account;
    }
    public String getBankName() {
      return bankName;
    }
    public void setBankName(String bankName) {
      this.bankName = bankName;
    }
    public String getLessonCertification() {
      return lessonCertification;
    }
    public void setLessonCertification(String lessonCertification) {
      this.lessonCertification = lessonCertification;
    }
    public String getTeacherIntroduce() {
      return teacherIntroduce;
    }
    public void setTeacherIntroduce(String teacherIntroduce) {
      this.teacherIntroduce = teacherIntroduce;
    }
    public Boolean getApprovalStatus() {
      return approvalStatus;
    }
    public void setApprovalStatus(Boolean approvalStatus) {
      this.approvalStatus = approvalStatus;
    }
    public String getVideoAddress() {
      return videoAddress;
    }
    public void setVideoAddress(String videoAddress) {
      this.videoAddress = videoAddress;
    }
    
    @Override
    public String toString() {
      return "Teacher [no=" + no + ", account=" + account + ", bankName=" + bankName
          + ", lessonCertification=" + lessonCertification + ", teacherIntroduce="
          + teacherIntroduce + ", approvalStatus=" + approvalStatus + ", videoAddress="
          + videoAddress + "]";
    }
    

}
