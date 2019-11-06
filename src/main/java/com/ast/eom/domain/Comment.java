package com.ast.eom.domain;

import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Comment {
  
  private int commentNo;
  private int boardNo;
  private int memberNo;
  private String commentContents;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date createdDate;
  private String memberId;
  private String profilePhoto;
  private int commentCnt;
  
  @Override
  public String toString() {
    return "Comment [commentNo=" + commentNo + ", boardNo=" + boardNo + ", memberNo=" + memberNo
        + ", commentContents=" + commentContents + ", createdDate=" + createdDate + ", memberId=" + memberId
        + ", profilePhoto=" + profilePhoto + ", commentCnt=" + commentCnt + "]";
  }
  public int getCommentCnt() {
    return commentCnt;
  }
  public void setCommentCnt(int commentCnt) {
    this.commentCnt = commentCnt;
  }
  public int getCommentNo() {
    return commentNo;
  }
  public void setCommentNo(int commentNo) {
    this.commentNo = commentNo;
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
  public String getCommentContents() {
    return commentContents;
  }
  public void setCommentContents(String commentContents) {
    this.commentContents = commentContents;
  }
  public Date getCreatedDate() {
    return createdDate;
  }
  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
  public String getMemberId() {
    return memberId;
  }
  public void setMemberId(String memberId) {
    this.memberId = memberId;
  }
  public String getProfilePhoto() {
    return profilePhoto;
  }
  public void setProfilePhoto(String profilePhoto) {
    this.profilePhoto = profilePhoto;
  }
  
}
