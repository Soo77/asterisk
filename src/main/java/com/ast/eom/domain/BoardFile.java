package com.ast.eom.domain;

import java.util.List;

public class BoardFile {

  private int fileNo;
  private String fileName;
  private int boardNo;
  private int noticeNo;
  
  private List<Board> boards;
  private List<Notice> notices;
  
  @Override
  public String toString() {
    return "BoardFile [fileNo=" + fileNo + ", fileName=" + fileName + ", boardNo=" + boardNo
        + ", noticeNo=" + noticeNo + ", boards=" + boards + ", notices=" + notices + "]";
  }
  public List<Board> getBoards() {
    return boards;
  }
  public void setBoards(List<Board> boards) {
    this.boards = boards;
  }
  public List<Notice> getNotices() {
    return notices;
  }
  public void setNotices(List<Notice> notices) {
    this.notices = notices;
  }
  public int getFileNo() {
    return fileNo;
  }
  public void setFileNo(int fileNo) {
    this.fileNo = fileNo;
  }
  public String getFileName() {
    return fileName;
  }
  public void setFileName(String fileName) {
    this.fileName = fileName;
  }
  public int getBoardNo() {
    return boardNo;
  }
  public void setBoardNo(int boardNo) {
    this.boardNo = boardNo;
  }
  public int getNoticeNo() {
    return noticeNo;
  }
  public void setNoticeNo(int noticeNo) {
    this.noticeNo = noticeNo;
  }
}
