package com.ast.eom.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ast.eom.dao.BoardDao;
import com.ast.eom.dao.MemberDao;
import com.ast.eom.domain.Board;
import com.ast.eom.service.BoardService;

// BoardService 기본 구현체 
//
@Service
public class DefaultBoardService implements BoardService {

  @Resource
  private BoardDao boardDao;
  
  @Resource
  private MemberDao memberDao;

  @Override
  public void insert(Board board) throws Exception {
    boardDao.insert(board);
  }

  @Override
  public void delete(int no) throws Exception {
    if (boardDao.findBy(no) == null)
      throw new Exception("해당 데이터가 없습니다.");
    
    boardDao.delete(no);
  }

  @Override
  public Board getWithIncreaseViewCount(int no) throws Exception {
    Board board = boardDao.findBy(no);
    if (board == null) {
      throw new Exception("해당 번호의 데이터가 없습니다!");
    } 
    boardDao.increaseViewCount(no);
    return board;
  }
  
  @Override
  public Board get(int no) throws Exception {
    Board board = boardDao.findBy(no);
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
    boardDao.update(board);
  }
}
