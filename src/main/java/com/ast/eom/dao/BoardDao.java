package com.ast.eom.dao;

import java.util.List;
import java.util.Map;
import com.ast.eom.domain.Board;

public interface BoardDao {
  List<Board> findAllBy(Map<String,Object> params) throws Exception;
  Board findBy(int no) throws Exception;
  Board findWithFilesBy(int no) throws Exception;
  int insert(Board board) throws Exception;
  int update(Board board) throws Exception;
  int delete(int no) throws Exception;
  int increaseViewCount(int no) throws Exception;
  int getListCount(int boardTypeNo) throws Exception;
}








