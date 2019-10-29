package com.ast.eom.domain;

import java.util.List;

public class BoardType {

  private int boardTypeNo;
  private String boardName;
  
  private List<Board> board;
  
  @Override
  public String toString() {
    return "BoardType [boardTypeNo=" + boardTypeNo + ", boardName=" + boardName + "]";
  }
  public List<Board> getBoard() {
    return board;
  }
  public void setBoard(List<Board> board) {
    this.board = board;
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
