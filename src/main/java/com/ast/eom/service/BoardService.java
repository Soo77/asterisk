package com.ast.eom.service;

import java.util.List;
import com.ast.eom.domain.Board;

public interface BoardService {
  List<Board> list(int boardTypeNo) throws Exception;
  Board get(int no) throws Exception;
  void insert(Board board) throws Exception;
  void update(Board board) throws Exception;
  void delete(int no) throws Exception;
}










