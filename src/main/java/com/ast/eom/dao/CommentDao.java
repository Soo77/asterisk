package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.Comment;

public interface CommentDao {
  // 댓글 목록
  public List<Comment> findAll(int boardNo) throws Exception;

  // 댓글 작성
  public int insert(Comment comment) throws Exception;
  
  // 댓글 수정
  public int update(Comment comment) throws Exception;

  // 댓글 삭제
  public int delete(int commentNo) throws Exception;
  
  //댓글 전부 삭제
  public int deleteAll(int boardNo) throws Exception;

}








