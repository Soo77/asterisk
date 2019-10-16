package com.ast.eom.domain;

import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Member implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int no;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date registeredDate;
  
  private int member_type;
  
  private char gender;
  
  private Date dateOfBirth;
  
  private String id;
  
  private String email;
  
  private String name;
  
  private String password;
  
  private String address;
  
  private String telephone;
  
  private String profile_photo;

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public Date getRegisteredDate() {
    return registeredDate;
  }

  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }

  public int getMember_type() {
    return member_type;
  }

  public void setMember_type(int member_type) {
    this.member_type = member_type;
  }

  public char getGender() {
    return gender;
  }

  public void setGender(char gender) {
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

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }
  
}
