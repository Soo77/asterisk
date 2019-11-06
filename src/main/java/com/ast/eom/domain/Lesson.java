package com.ast.eom.domain;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Lesson {
  private int lessonNo;
  private int teacherNo;
  private int studentNo;
  private String lessonDescription;
  private int subjectNo;
  private int lessonFee;
  private int lessonState;
  private boolean studentLessonStop;
  private boolean teacherLessonStop;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date startDate;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date endDate;
  private String teacherReview;
  private String studentReview;
  private int teacherEvaluation;
  private int paymentMethod;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date payDay;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date calculationDay;
  private int calculationState;
  private String studentStopReason;
  private String teacherStopReason;
  private boolean refundState;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date refundDate;
  private int refundAmount;
  
  private CurriculumLessonContents clc;
  
  private Member member;
  private List<CurriculumLessonContents> clcs;
  private Curriculum curriculum;
  private Subject subject;
  private String subjectName;
  
  private List<Member> members;
  private List<Curriculum> curriculums;
  private List<DayLesson> dayLessons;
  
  @Override
  public String toString() {
    return "Lesson [lessonNo=" + lessonNo + ", teacherNo=" + teacherNo + ", studentNo=" + studentNo
        + ", lessonDescription=" + lessonDescription + ", subjectNo=" + subjectNo + ", lessonFee="
        + lessonFee + ", lessonState=" + lessonState + ", studentLessonStop=" + studentLessonStop
        + ", teacherLessonStop=" + teacherLessonStop + ", startDate=" + startDate + ", endDate="
        + endDate + ", teacherReview=" + teacherReview + ", studentReview=" + studentReview
        + ", teacherEvaluation=" + teacherEvaluation + ", paymentMethod=" + paymentMethod
        + ", payDay=" + payDay + ", calculationDay=" + calculationDay + ", calculationState="
        + calculationState + ", studentStopReason=" + studentStopReason + ", teacherStopReason="
        + teacherStopReason + ", refundState=" + refundState + ", refundDate=" + refundDate
        + ", refundAmount=" + refundAmount + ", clc=" + clc + ", member=" + member + ", clcs="
        + clcs + ", curriculum=" + curriculum + ", subject=" + subject + ", subjectName="
        + subjectName + ", members=" + members + ", curriculums=" + curriculums + ", dayLessons="
        + dayLessons + "]";
  }

  public CurriculumLessonContents getClc() {
    return clc;
  }

  public void setClc(CurriculumLessonContents clc) {
    this.clc = clc;
  }

  public int getLessonNo() {
    return lessonNo;
  }
  public void setLessonNo(int lessonNo) {
    this.lessonNo = lessonNo;
  }
  public int getTeacherNo() {
    return teacherNo;
  }
  public void setTeacherNo(int teacherNo) {
    this.teacherNo = teacherNo;
  }
  public int getStudentNo() {
    return studentNo;
  }
  public void setStudentNo(int studentNo) {
    this.studentNo = studentNo;
  }
  public int getSubjectNo() {
    return subjectNo;
  }
  public void setSubjectNo(int subjectNo) {
    this.subjectNo = subjectNo;
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
  public List<Curriculum> getCurriculums() {
    return curriculums;
  }
  public void setCurriculums(List<Curriculum> curriculums) {
    this.curriculums = curriculums;
  }
  public List<DayLesson> getDayLessons() {
    return dayLessons;
  }
  public void setDayLessons(List<DayLesson> dayLessons) {
    this.dayLessons = dayLessons;
  }
  public List<Member> getMembers() {
    return members;
  }
  public void setMembers(List<Member> members) {
    this.members = members;
  }
  public Member getMember() {
    return member;
  }
  public void setMember(Member member) {
    this.member = member;
  }
  public String getSubjectName() {
    return subjectName;
  }
  public void setSubjectName(String subjectName) {
    this.subjectName = subjectName;
  }
  public List<CurriculumLessonContents> getClcs() {
    return clcs;
  }
  public void setClcs(List<CurriculumLessonContents> clcs) {
    this.clcs = clcs;
  }
  public Subject getSubject() {
    return subject;
  }
  public void setSubject(Subject subject) {
    this.subject = subject;
  }
  public Curriculum getCurriculum() {
    return curriculum;
  }
  public void setCurriculum(Curriculum curriculum) {
    this.curriculum = curriculum;
  }
  
  
  
}
