package com.ast.eom.domain;

import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Comment {
  
  private int commentNo;
  private int boardNo;
  private int memberNo;
  private String contents;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date createdDate;
  
  private Board board;
  private Member member;
  
  @Override
  public String toString() {
    return "Comment [commentNo=" + commentNo + ", boardNo=" + boardNo + ", memberNo=" + memberNo
        + ", contents=" + contents + ", createdDate=" + createdDate + ", board=" + board
        + ", member=" + member + "]";
  }
  public int getBoardNo() {
    return boardNo;
  }
  public void setBoardNo(int boardNo) {
    this.boardNo = boardNo;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public int getCommentNo() {
    return commentNo;
  }
  public void setCommentNo(int commentNo) {
    this.commentNo = commentNo;
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
}
