package com.ast.eom.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ast.eom.dao.CommentDao;
import com.ast.eom.domain.Comment;
import com.ast.eom.service.CommentService;

@Service
public class DefaultCommentService implements CommentService {

  @Resource private CommentDao commentDao;

  @Override
  public List<Comment> list(int boardNo) throws Exception {
    return commentDao.findAll(boardNo);
  }
  
  @Override
  public int insert(Comment comment) throws Exception {
    return commentDao.insert(comment);
  }
  
  @Override
  public int update(Comment comment) throws Exception {
    return commentDao.update(comment);
  }
  
  @Override
  public int delete(int commentNo) throws Exception {
    return commentDao.delete(commentNo);
  }
}
