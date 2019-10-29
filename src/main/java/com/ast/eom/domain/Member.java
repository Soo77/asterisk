package com.ast.eom.domain;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Member {

  private int memberNo;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date registeredDate;
  private String gender;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date dateOfBirth;
  private String id;
  private String email;
  private String name;
  private String password;
  private String addressCity;
  private String addressSuburb;
  private String tel;
  private String profilePhoto;
  
  private Teacher teacher;
  private Parents parents;
  private Student student;
  private MemberType memberType;
  
  private int memberTypeNo;

  private List<Message> sentMessages;
  private List<Message> receivedMessages;
  private List<Board> boards;
  private List<Notice> notices;
  private List<Comment> comments;
  
  @Override
  public String toString() {
    return "Member [memberNo=" + memberNo + ", registeredDate=" + registeredDate + ", gender=" + gender
        + ", dateOfBirth=" + dateOfBirth + ", id=" + id + ", email=" + email + ", name=" + name + ", password="
        + password + ", addressCity=" + addressCity + ", addressSuburb=" + addressSuburb + ", tel=" + tel
        + ", profilePhoto=" + profilePhoto + ", teacher=" + teacher + ", parents=" + parents + ", student=" + student
        + ", memberType=" + memberType + ", sentMessages=" + sentMessages + ", receivedMessages=" + receivedMessages
        + ", boards=" + boards + ", notices=" + notices + ", comments=" + comments + "]";
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
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
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
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getProfilePhoto() {
    return profilePhoto;
  }
  public void setProfilePhoto(String profilePhoto) {
    this.profilePhoto = profilePhoto;
  }
  public Teacher getTeacher() {
    return teacher;
  }
  public void setTeacher(Teacher teacher) {
    this.teacher = teacher;
  }
  public Parents getParents() {
    return parents;
  }
  public void setParents(Parents parents) {
    this.parents = parents;
  }
  public Student getStudent() {
    return student;
  }
  public void setStudent(Student student) {
    this.student = student;
  }
  public MemberType getMemberType() {
    return memberType;
  }
  public void setMemberType(MemberType memberType) {
    this.memberType = memberType;
  }
  public List<Message> getSentMessages() {
    return sentMessages;
  }
  public void setSentMessages(List<Message> sentMessages) {
    this.sentMessages = sentMessages;
  }
  public List<Message> getReceivedMessages() {
    return receivedMessages;
  }
  public void setReceivedMessages(List<Message> receivedMessages) {
    this.receivedMessages = receivedMessages;
  }
  public List<Board> getBoards() {
    return boards;
  }
  public void setBoards(List<Board> boards) {
    this.boards = boards;
  }
  public List<Notice> getNotices() {
    return notices;
  }
  public void setNotices(List<Notice> notices) {
    this.notices = notices;
  }
  public List<Comment> getComments() {
    return comments;
  }
  public void setComments(List<Comment> comments) {
    this.comments = comments;
  }
  public int getMemberTypeNo() {
    return memberTypeNo;
  }
  public void setMemberTypeNo(int memberTypeNo) {
    this.memberTypeNo = memberTypeNo;
  }
  
}
