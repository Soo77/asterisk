package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.Comment;

public interface CommentDao {
  public List<Comment> findAll(int boardNo) throws Exception;
  public int insert(Comment comment) throws Exception;
  public int update(Comment comment) throws Exception;
  public int delete(int commentNo) throws Exception;
  public int deleteAll(int boardNo) throws Exception;
}








