package com.ast.eom.domain;

import java.sql.Date;

public class Member {

    private int no;
    private MemberType memberType;
    private Date registeredDate;
    private String gender;
    private Date dateOfBirth;
    private String id;
    private String email;
    private String name;
    private String password;
    private String address;
    private String tel;
    private String profilePhoto;
    
    
    Teacher teacher;
    
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
    public String getProfilePhoto() {
      return profilePhoto;
    }
    public void setProfilePhoto(String profilePhoto) {
      this.profilePhoto = profilePhoto;
    }
    public MemberType getMemberType() {
      return memberType;
    }
    public void setMemberType(MemberType memberType) {
      this.memberType = memberType;
    }
    
    @Override
    public String toString() {
      return "Member [no=" + no + ", registeredDate=" + registeredDate + ", gender=" + gender
          + ", dateOfBirth=" + dateOfBirth + ", id=" + id + ", email=" + email + ", name=" + name
          + ", password=" + password + ", address=" + address + ", tel=" + tel + ", profilePhoto="
          + profilePhoto + "]";
    }
    
    

}
