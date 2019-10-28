package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.Board;

public interface BoardDao {
  List<Board> findAllBy(int boardTypeNo) throws Exception;
  Board findBy(int no) throws Exception;
  Board findWithFilesBy(int no) throws Exception;
  int insert(Board board) throws Exception;
  int update(Board board) throws Exception;
  int delete(int no) throws Exception;
  int increaseViewCount(int no) throws Exception;
}








