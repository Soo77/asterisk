package com.ast.eom.dao;

import java.util.List;
import java.util.Map;
import com.ast.eom.domain.BoardFile;

// DAO 사용 규칙을 정의한다.
public interface BoardFileDao {
  int insert(Map<String, Object> params) throws Exception;
  List<BoardFile> findAll(int boardNo) throws Exception;
  int deleteAll(int boardNo) throws Exception;
}








