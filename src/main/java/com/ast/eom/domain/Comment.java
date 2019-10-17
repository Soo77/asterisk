package com.ast.eom.domain;

import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Comment {
  
  private int commentNo;
  private Board board;
  private Member member;
  private String contents;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date createdDate;
  
  @Override
  public String toString() {
    return "Comment [commentNo=" + commentNo + ", board=" + board + ", member=" + member
        + ", contents=" + contents + ", createdDate=" + createdDate + "]";
  }
  public int getCommentNo() {
    return commentNo;
  }
  public void setCommentNo(int commentNo) {
    this.commentNo = commentNo;
  }
  public Board getBoard() {
    return board;
  }
  public void setBoard(Board board) {
    this.board = board;
  }
  public Member getMember() {
    return member;
  }
  public void setMember(Member member) {
    this.member = member;
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
  
}
