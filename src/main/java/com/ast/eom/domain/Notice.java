package com.ast.eom.domain;

import java.sql.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Notice {
  
  private int noticeNo;
  private int memberNo;
  private String title;
  private String contents;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date createdDate;
  private int viewCount;
  
  private Member member;
  private List<BoardFile> files;

  @Override
  public String toString() {
    return "Notice [noticeNo=" + noticeNo + ", memberNo=" + memberNo + ", title=" + title
        + ", contents=" + contents + ", createdDate=" + createdDate + ", viewCount=" + viewCount
        + ", member=" + member + ", files=" + files + "]";
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public List<BoardFile> getFiles() {
    return files;
  }
  public void setFiles(List<BoardFile> files) {
    this.files = files;
  }
  public int getNoticeNo() {
    return noticeNo;
  }
  public void setNoticeNo(int noticeNo) {
    this.noticeNo = noticeNo;
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
