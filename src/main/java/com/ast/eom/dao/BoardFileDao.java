package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.BoardFile;

// DAO 사용 규칙을 정의한다.
public interface BoardFileDao {
  int insert(BoardFile boardFile) throws Exception;
  List<BoardFile> findAll(int boardNo) throws Exception;
  int deleteAll(int boardNo) throws Exception;
}








