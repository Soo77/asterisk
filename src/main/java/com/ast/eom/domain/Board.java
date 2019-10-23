package com.ast.eom.domain;

import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Board {
  
  private int boardNo;
  private String title;
  private String contents;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date createdDate;
  private int viewCount;
  
  private BoardType boardType;
  private Member member;
  
  @Override
  public String toString() {
    return "Board [boardNo=" + boardNo + ", title=" + title + ", contents=" + contents + ", createdDate=" + createdDate
        + ", viewCount=" + viewCount + ", boardType=" + boardType + ", member=" + member + "]";
  }
  public int getBoardNo() {
    return boardNo;
  }
  public void setBoardNo(int boardNo) {
    this.boardNo = boardNo;
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
  public BoardType getBoardType() {
    return boardType;
  }
  public void setBoardType(BoardType boardType) {
    this.boardType = boardType;
  }
  public Member getMember() {
    return member;
  }
  public void setMember(Member member) {
    this.member = member;
  }
}
