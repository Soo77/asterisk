package com.ast.eom.domain;

public class BoardType {

  private int boardTypeNo;
  private String boardName;
  
  @Override
  public String toString() {
    return "BoardType [boardTypeNo=" + boardTypeNo + ", boardName=" + boardName + "]";
  }
  public int getBoardTypeNo() {
    return boardTypeNo;
  }
  public void setBoardTypeNo(int boardTypeNo) {
    this.boardTypeNo = boardTypeNo;
  }
  public String getBoardName() {
    return boardName;
  }
  public void setBoardName(String boardName) {
    this.boardName = boardName;
  }
  
}
