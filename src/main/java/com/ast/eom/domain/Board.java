package com.ast.eom.domain;

import java.io.Serializable;
import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Board implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int no;
  private int type_no;
  private int member_no;
  private String title;
  private String contents;
  
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date createdDate;
  
  private int view_count;
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public int getType_no() {
    return type_no;
  }
  public void setType_no(int type_no) {
    this.type_no = type_no;
  }
  public int getMember_no() {
    return member_no;
  }
  public void setMember_no(int member_no) {
    this.member_no = member_no;
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
  public int getView_count() {
    return view_count;
  }
  public void setView_count(int view_count) {
    this.view_count = view_count;
  }
  
  
  
}
