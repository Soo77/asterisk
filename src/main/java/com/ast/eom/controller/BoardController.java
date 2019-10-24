package com.ast.eom.controller;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.ast.eom.domain.Board;
import com.ast.eom.domain.BoardFile;
import com.ast.eom.domain.BoardType;
import com.ast.eom.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
  
  @Resource private FileWriter fileWriter;
  @Resource private BoardService boardService;
  
  @GetMapping("form")
  public void form() {
    
  }
  
  @PostMapping("add")
  public String add(
      BoardType boardType,
      Board board,
      MultipartFile[] fileName) throws Exception {
    List<BoardFile> files = fileWriter.getFiles(board, fileName);
    board.setBoardType(boardType);
    boardService.insert(board, files);
    return "redirect:list?boardTypeNo=" + boardType.getBoardTypeNo();
  }
  
  @GetMapping("list")
  public void list(Model model, int boardTypeNo) throws Exception {
    List<Board> boards = boardService.list(boardTypeNo);
    model.addAttribute("boards", boards);
  }
  
  @GetMapping("detail")
  public void detail(Model model, int no) throws Exception {
    List<BoardFile> boardFileList = boardService.getWithIncreaseViewCount(no);
    model.addAttribute("boardFileList", boardFileList);
  }
  
  @GetMapping("detailedit")
  public void detailedit(Model model, int no) throws Exception {
    Board board = boardService.get(no);
    model.addAttribute("board", board);
  }
  
  @PostMapping("update")
  public String update(Model model, int no) 
      throws Exception {
    Board board = boardService.get(no);
    boardService.update(board);
    model.addAttribute("board", board);
    return "redirect:list";
  // public String update(BoardType boardType, Board board) throws Exception {
    // board.setBoardType(boardType);
    // boardService.update(board);
    // return "redirect:list?boardTypeNo=" + boardType.getBoardTypeNo();
  }
  
  @GetMapping("delete")
  public String delete(int no) throws Exception {
    Board board = boardService.get(no);
    boardService.delete(no);
    return "redirect:list?boardTypeNo=" + board.getBoardType().getBoardTypeNo();
  }
  
}
