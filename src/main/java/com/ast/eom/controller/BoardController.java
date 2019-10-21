package com.ast.eom.controller;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ast.eom.domain.Board;
import com.ast.eom.domain.BoardType;
import com.ast.eom.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
  
  @Resource
  private BoardService boardService;
  
  @GetMapping("form")
  public void form() {
    
  }
  
  @PostMapping("add")
  public String add(BoardType boardType, Board board) throws Exception {
    System.out.println(boardType.getBoardTypeNo());
    return "redirect:list?boardTypeNo=" + boardType.getBoardTypeNo();
  }
  
  @GetMapping("list")
  public void list(Model model, int boardTypeNo) throws Exception {
    List<Board> boards = boardService.list(boardTypeNo);
    model.addAttribute("boards", boards);
  }
  
  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    Board board = boardService.get(no);
    model.addAttribute("board", board);
  }
  
  @PostMapping("update")
  public String update(Board board) throws Exception {
    boardService.update(board);
    return "redirect:list";
  }
  
  @GetMapping("delete")
  public String delete(int no) throws Exception {
    boardService.delete(no);
    return "redirect:list";
  }
  
}
