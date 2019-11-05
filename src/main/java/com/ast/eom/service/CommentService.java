package com.ast.eom.service;

import java.util.List;
import com.ast.eom.domain.Comment;

public interface CommentService {
  List<Comment> list(int boardNo) throws Exception;
  int insert(Comment comment) throws Exception;
  int update(Comment comment) throws Exception;
  int delete(int commentNo) throws Exception;
}










