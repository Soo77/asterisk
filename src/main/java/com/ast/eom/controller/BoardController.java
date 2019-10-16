package com.ast.eom.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ast.eom.dao.BoardDao;
import com.ast.eom.domain.Board;

@Controller
public class BoardController {
  
  @Autowired
  BoardDao boardDao;
  
  @RequestMapping("/board/list")
  public String list(Model model) throws Exception {
    List<Board> boards = boardDao.findAll();
    
    model.addAttribute("boards", boards);
    
    return "/WEB-INF/jsp/list.jsp";
  }
  
  @RequestMapping("/board/form")
  public String form() throws Exception {
    
    return "/WEB-INF/jsp/form.jsp";
  }
  
  @RequestMapping("/board/add")
  public String add(String ta) throws Exception {
    Board board = new Board();
    board.setContents(ta);
    boardDao.insert(board);
    
    return "redirect:list";
  }
  
  @RequestMapping("/board/update")
  public String update(Board board) throws Exception {
    boardDao.update(board);
    return "redirect:list";
  }
  
  @RequestMapping("/board/delete")
  public String delete(int no) throws Exception {
    boardDao.delete(no);
    return "redirect:list";
  }
  
  @RequestMapping("/board/detail")
  public String detail(Model model, int no) 
      throws Exception {
    Board board = boardDao.findBy(no);
    model.addAttribute("board", board);
    return "/WEB-INF/jsp/detail.jsp";
  }
  
  

}
