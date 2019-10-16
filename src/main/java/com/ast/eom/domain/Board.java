package com.ast.eom.domain;

import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Board implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int no;
  private int typeNo;
  private int memberNo;
  private String title;
  private String contents;
  private Member member;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date createdDate;
  private int viewCount;
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getTypeNo() {
    return typeNo;
  }
  public void setTypeNo(int typeNo) {
    this.typeNo = typeNo;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  public Date getCreatedDate() {
    return createdDate;
  }
  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
  public int getViewCount() {
    return viewCount;
  }
  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }
  public Member getMember() {
    return member;
  }
  public void setMember(Member member) {
    this.member = member;
  }
  
  
  
  
  
}
