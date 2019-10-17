package com.ast.eom.domain;

public class BoardFile {

  private int boardNo;
  private String fileName;
  private Board board;
  private Notice notice;
  
  @Override
  public String toString() {
    return "BoardFile [boardNo=" + boardNo + ", fileName=" + fileName + ", board=" + board
        + ", notice=" + notice + "]";
  }
  public int getBoardNo() {
    return boardNo;
  }
  public void setBoardNo(int boardNo) {
    this.boardNo = boardNo;
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
