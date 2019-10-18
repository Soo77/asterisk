package com.ast.eom.domain;

import java.sql.Date;

public class Lesson {
  private int lessonNo;
  private Teacher teacher;
  private Student student;
  private Subject subject;
  private String lessonDescription;
  private int lessonFee;
  private int lessonState;
  private boolean studentLessonStop;
  private boolean teacherLessonStop;
  private Date startDate;
  private Date endDate;
  private String teacherReview;
  private String studentReview;
  private int teacherEvaluation;
  private int paymentMethod;
  private Date payDay;
  private Date calculationDay;
  private int calculationState;
  private String studentStopReason;
  private String teacherStopReason;
  private boolean refundState;
  private Date refundDate;
  private int refundAmount;
  
  public int getLessonNo() {
    return lessonNo;
  }
  public void setLessonNo(int lessonNo) {
    this.lessonNo = lessonNo;
  }
  public Teacher getTeacher() {
    return teacher;
  }
  public void setTeacher(Teacher teacher) {
    this.teacher = teacher;
  }
  public Student getStudent() {
    return student;
  }
  public void setStudent(Student student) {
    this.student = student;
  }
  public Subject getSubject() {
    return subject;
  }
  public void setSubject(Subject subject) {
    this.subject = subject;
  }
  public String getLessonDescription() {
    return lessonDescription;
  }
  public void setLessonDescription(String lessonDescription) {
    this.lessonDescription = lessonDescription;
  }
  public int getLessonFee() {
    return lessonFee;
  }
  public void setLessonFee(int lessonFee) {
    this.lessonFee = lessonFee;
  }
  public int getLessonState() {
    return lessonState;
  }
  public void setLessonState(int lessonState) {
    this.lessonState = lessonState;
  }
  public boolean isStudentLessonStop() {
    return studentLessonStop;
  }
  public void setStudentLessonStop(boolean studentLessonStop) {
    this.studentLessonStop = studentLessonStop;
  }
  public boolean isTeacherLessonStop() {
    return teacherLessonStop;
  }
  public void setTeacherLessonStop(boolean teacherLessonStop) {
    this.teacherLessonStop = teacherLessonStop;
  }
  public Date getStartDate() {
    return startDate;
  }
  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }
  public Date getEndDate() {
    return endDate;
  }
  public void setEndDate(Date endDate) {
    this.endDate = endDate;
  }
  public String getTeacherReview() {
    return teacherReview;
  }
  public void setTeacherReview(String teacherReview) {
    this.teacherReview = teacherReview;
  }
  public String getStudentReview() {
    return studentReview;
  }
  public void setStudentReview(String studentReview) {
    this.studentReview = studentReview;
  }
  public int getTeacherEvaluation() {
    return teacherEvaluation;
  }
  public void setTeacherEvaluation(int teacherEvaluation) {
    this.teacherEvaluation = teacherEvaluation;
  }
  public int getPaymentMethod() {
    return paymentMethod;
  }
  public void setPaymentMethod(int paymentMethod) {
    this.paymentMethod = paymentMethod;
  }
  public Date getPayDay() {
    return payDay;
  }
  public void setPayDay(Date payDay) {
    this.payDay = payDay;
  }
  public Date getCalculationDay() {
    return calculationDay;
  }
  public void setCalculationDay(Date calculationDay) {
    this.calculationDay = calculationDay;
  }
  public int getCalculationState() {
    return calculationState;
  }
  public void setCalculationState(int calculationState) {
    this.calculationState = calculationState;
  }
  public String getStudentStopReason() {
    return studentStopReason;
  }
  public void setStudentStopReason(String studentStopReason) {
    this.studentStopReason = studentStopReason;
  }
  public String getTeacherStopReason() {
    return teacherStopReason;
  }
  public void setTeacherStopReason(String teacherStopReason) {
    this.teacherStopReason = teacherStopReason;
  }
  public boolean isRefundState() {
    return refundState;
  }
  public void setRefundState(boolean refundState) {
    this.refundState = refundState;
  }
  public Date getRefundDate() {
    return refundDate;
  }
  public void setRefundDate(Date refundDate) {
    this.refundDate = refundDate;
  }
  public int getRefundAmount() {
    return refundAmount;
  }
  public void setRefundAmount(int refundAmount) {
    this.refundAmount = refundAmount;
  }
}
