package com.ast.eom.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ast.eom.dao.BoardDao;
import com.ast.eom.dao.BoardFileDao;
import com.ast.eom.dao.MemberDao;
import com.ast.eom.domain.Board;
import com.ast.eom.domain.BoardFile;
import com.ast.eom.service.BoardService;

// BoardService 기본 구현체 
//
@Service
public class DefaultBoardService implements BoardService {

  @Resource private BoardDao boardDao;
  @Resource private MemberDao memberDao;
  @Resource private BoardFileDao boardFileDao;

  @Transactional
  @Override
  public void insert(Board board) throws Exception {
    if (board.getFiles().size() == 0) {
      throw new Exception("사진 파일 없음!");
    }
    boardDao.insert(board);
    for (BoardFile file : board.getFiles()) {
      file.setBoardNo(board.getBoardNo());
      boardFileDao.insert(file);
    }
  }

  @Override
  public void delete(int no) throws Exception {
    if (boardDao.findBy(no) == null)
      throw new Exception("해당 데이터가 없습니다.");
    boardFileDao.deleteAll(no);
    boardDao.delete(no);
  }

  @Override
  public Board getWithIncreaseViewCount(int no) throws Exception {
    Board board = boardDao.findWithFilesBy(no);
    if (board == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    }
    boardDao.increaseViewCount(no);
    return board;
  }
  
  @Override
  public Board get(int no) throws Exception {
    Board board = boardDao.findWithFilesBy(no);
    if (board == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    } 
    return board;
  }

  @Override
  public List<Board> list(int boardTypeNo) throws Exception {
    return boardDao.findAll(boardTypeNo);
  }

  @Override
  public void update(Board board) throws Exception {
    if (board.getFiles().size() == 0) {
      throw new Exception("사진 파일 없음!");
    }
    boardDao.update(board);
    boardFileDao.deleteAll(board.getBoardNo());
    for (BoardFile file : board.getFiles()) {
      file.setBoardNo(board.getBoardNo());
      boardFileDao.insert(file);
    }
  }
}
