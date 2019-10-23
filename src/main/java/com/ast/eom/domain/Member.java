package com.ast.eom.domain;

import java.sql.Date;
import java.util.List;

public class Member {

  private int memberNo;
  private int memberTypeNo;
  private Date registeredDate;
  private String gender;
  private Date dateOfBirth;
  private String id;
  private String email;
  private String name;
  private String password;
  private String addressCity;
  private String addressSuburb;
  private String tel;
  private String profilePhoto;

  private List<Message> sentMessages;
  private List<Message> receivedMessages;
  private List<Notice> notices;
  private List<Comment> comments;
  
  @Override
  public String toString() {
    return "Member [memberNo=" + memberNo + ", memberTypeNo=" + memberTypeNo + ", registeredDate=" + registeredDate
        + ", gender=" + gender + ", dateOfBirth=" + dateOfBirth + ", id=" + id + ", email=" + email + ", name=" + name
        + ", password=" + password + ", addressCity=" + addressCity + ", addressSuburb=" + addressSuburb + ", tel="
        + tel + ", profilePhoto=" + profilePhoto + ", sentMessage=" + sentMessages + ", receivedMessage="
        + receivedMessages + ", notices=" + notices + ", comments=" + comments + "]";
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
  public List<Message> getSentMessage() {
    return sentMessages;
  }
  public void setSentMessage(List<Message> sentMessage) {
    this.sentMessages = sentMessage;
  }
  public List<Message> getReceivedMessage() {
    return receivedMessages;
  }
  public void setReceivedMessage(List<Message> receivedMessage) {
    this.receivedMessages = receivedMessage;
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
}
