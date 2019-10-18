package com.ast.eom.domain;

import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Notice {
  
  private int noticeNo;
  private String title;
  private int viewCount;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date createdDate;
  private String contents;
  
  @Override
  public String toString() {
    return "Notice [noticeNo=" + noticeNo + ", title=" + title + ", viewCount=" + viewCount
        + ", createdDate=" + createdDate + ", contents=" + contents + "]";
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
  public int getViewCount() {
    return viewCount;
  }
  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }
  public Date getCreatedDate() {
    return createdDate;
  }
  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  
}
