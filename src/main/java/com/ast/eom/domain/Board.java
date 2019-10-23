package com.ast.eom.domain;

import java.sql.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Board {
  
  private int boardNo;
  private int boardTypeNo;
  private int memberNo;  
  private String title;
  private String contents;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date createdDate;
  private int viewCount;
  
  private List<BoardFile> files;
  private List<Comment> comments;
  
  @Override
  public String toString() {
    return "Board [boardNo=" + boardNo + ", boardTypeNo=" + boardTypeNo + ", memberNo=" + memberNo
        + ", title=" + title + ", contents=" + contents + ", createdDate=" + createdDate
        + ", viewCount=" + viewCount + ", files=" + files + ", comments=" + comments + "]";
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public List<Comment> getComments() {
    return comments;
  }
  public void setComments(List<Comment> comments) {
    this.comments = comments;
  }
  public List<BoardFile> getFiles() {
    return files;
  }
  public void setFiles(List<BoardFile> files) {
    this.files = files;
  }
  public int getBoardNo() {
    return boardNo;
  }
  public void setBoardNo(int boardNo) {
    this.boardNo = boardNo;
  }
  public int getBoardTypeNo() {
    return boardTypeNo;
  }
  public void setBoardTypeNo(int boardTypeNo) {
    this.boardTypeNo = boardTypeNo;
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
}
