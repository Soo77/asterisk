package com.ast.eom.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.ast.eom.domain.Board;
import com.ast.eom.domain.Pagination;
import com.ast.eom.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
  
  @Autowired private FileWriter fileWriter;
  @Autowired private BoardService boardService;
  
  @GetMapping("form")
  public void form(Model model, int boardTypeNo) {
    model.addAttribute("boardTypeNo", boardTypeNo);
  }

  @PostMapping("add")
  public String add(
      Board board,
      MultipartFile[] fileName,
      HttpSession session) throws Exception {
    int memberNo = (Integer) session.getAttribute("memberNo");
    board.setMemberNo(memberNo);
    board.setFiles(fileWriter.getFiles(fileName));
    boardService.insert(board);
    return "redirect:list?boardTypeNo=" + board.getBoardTypeNo();
  }
  
  @GetMapping("list")
  public void list(
      int boardTypeNo,
      HttpSession session,
      Model model,
      @RequestParam(defaultValue = "1") int curPage,
      @RequestParam(defaultValue = "") String searchType,
      @RequestParam(defaultValue = "") String keyword) throws Exception {
    session.setAttribute("memberNo", 4);
    
    List<Board> boards = boardService.list(boardTypeNo, searchType, keyword);
    int listCnt = boards.size();
    Pagination pagination = new Pagination(listCnt, curPage);
    
    model.addAttribute("boards", boards);
    model.addAttribute("listCnt", listCnt);
    model.addAttribute("pagination", pagination);
    model.addAttribute("boardTypeNo", boardTypeNo);
    model.addAttribute("searchType", searchType);
    model.addAttribute("keyword", keyword);
  }
  
  @GetMapping("detail")
  public void detail(HttpSession session, Model model, int no) throws Exception {
    session.setAttribute("memberNo", 4);
    Board board = boardService.get(no);
    model.addAttribute("board", board);
  }
  
  @PostMapping("update")
  public String update(Board board, MultipartFile[] fileName) throws Exception {
    board.setFiles(fileWriter.getFiles(fileName));
    boardService.update(board);
    return "redirect:list?boardTypeNo=" + board.getBoardTypeNo();
  }
  
  @GetMapping("delete")
  public String delete(int no) throws Exception {
    Board board = boardService.get(no);
    boardService.delete(no);
    return "redirect:list?boardTypeNo=" + board.getBoardTypeNo();
  }
  
//  @GetMapping("ohora")
//  @ResponseBody
//  public String ohora(int no) {
//    return no+"+111";
//  }
  
}
