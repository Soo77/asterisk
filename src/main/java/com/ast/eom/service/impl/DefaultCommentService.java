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
  
//  @Override
//  public Board get(int no) throws Exception {
//    Board board = boardDao.findWithFilesBy(no);
//    if (board == null) {
//      throw new Exception("해당 번호의 데이터가 없습니다!");
//    } 
//    boardDao.increaseViewCount(no);
//    return board;
//  }
//
//  @Transactional
//  @Override
//  public void insert(Board board) throws Exception {
////    if (board.getFiles().size() == 0) {
////      throw new Exception("사진 파일 없음!");
////    }
//    boardDao.insert(board);
//    if (board.getFiles().size() > 0) {
//      for (BoardFile file : board.getFiles()) {
//        file.setBoardNo(board.getBoardNo());
//        boardFileDao.insert(file);
//      }
//    }
//  }
//  
//  @Override
//  public void update(Board board) throws Exception {
////    if (board.getFiles().size() == 0) {
////      throw new Exception("사진 파일 없음!");
////    }
//    boardDao.update(board);
//    if (board.getFiles().size() > 0) {
////      boardFileDao.deleteAll(board.getBoardNo());
//      for (BoardFile file : board.getFiles()) {
//        file.setBoardNo(board.getBoardNo());
//        boardFileDao.insert(file);
//      }
//    }
//  }
//  
//  @Override
//  public void delete(int no) throws Exception {
//    if (boardDao.findBy(no) == null)
//      throw new Exception("해당 데이터가 없습니다.");
//    boardFileDao.deleteAll(no);
//    boardDao.delete(no);
//  }
}
