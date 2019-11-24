package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.BoardFile;

public interface BoardFileDao {
  int insert(BoardFile boardFile) throws Exception;
  List<BoardFile> findAll(int boardNo) throws Exception;
  int deleteAll(int boardNo) throws Exception;
}








