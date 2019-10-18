package com.ast.eom.domain;

public class BoardFile {

  private int fileNo;
  private String fileName;
  private Board board;
  private Notice notice;
  

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
  public Board getBoard() {
    return board;
  }
  public void setBoard(Board board) {
    this.board = board;
  }
  public Notice getNotice() {
    return notice;
  }
  public void setNotice(Notice notice) {
    this.notice = notice;
  }
  
}
