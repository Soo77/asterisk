package com.ast.eom.dao;

import java.util.List;

import com.ast.eom.domain.Board;

// DAO 사용 규칙을 정의한다.
public interface BoardDao {
  List<Board> findAll() throws Exception;
  int insert(Board board) throws Exception;
}








