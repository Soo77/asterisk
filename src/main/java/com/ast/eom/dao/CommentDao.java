package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.Comment;

public interface CommentDao {
  //댓글 개수
  public int commentCount(int boardNo) throws Exception;

  // 댓글 목록
  public List<Comment> findAll(int boardNo) throws Exception;

//  // 댓글 작성
//  public int commentInsert(Comment comment) throws Exception;
//  
//  // 댓글 수정
//  public int commentUpdate(Comment comment) throws Exception;
//
//  // 댓글 삭제
//  public int commentDelete(int cno) throws Exception;

}








