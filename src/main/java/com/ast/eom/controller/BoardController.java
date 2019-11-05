package com.ast.eom.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.ast.eom.domain.Board;
import com.ast.eom.domain.Comment;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Pagination;
import com.ast.eom.service.BoardService;
import com.ast.eom.service.CommentService;

@Controller
@RequestMapping("/board")
public class BoardController {
  
  @Autowired private FileWriter fileWriter;
  @Autowired private BoardService boardService;
  @Autowired private CommentService commentService;
  
  @GetMapping("form")
  public void form(Model model, int boardTypeNo) {
    model.addAttribute("boardTypeNo", boardTypeNo);
  }

  @PostMapping("add")
  public String add(
      Board board,
      MultipartFile[] fileName,
      HttpSession session) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    int memberNo = member.getMemberNo();
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
  
  @GetMapping("comment/list")
  @ResponseBody
  private List<Comment> commentList(int boardNo) throws Exception{
      return commentService.list(boardNo);
  }
  
  @PostMapping("comment/add")
  @ResponseBody
  public int commentAdd(
      HttpSession session,
      @RequestParam int boardNo,
      @RequestParam String contents) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    int memberNo = member.getMemberNo();
    Comment comment = new Comment();
    comment.setBoardNo(boardNo);;
    comment.setContents(contents);
    comment.setMemberNo(memberNo);
    
    return commentService.insert(comment);
  }
  
  @RequestMapping("comment/update")
  @ResponseBody
  private int cmmentUpdate(@RequestParam int commentNo, @RequestParam String contents) throws Exception{
      
      Comment comment = new Comment();
      comment.setCommentNo(commentNo);
      comment.setContents(contents);
      
      return commentService.update(comment);
  }
  
  @RequestMapping("comment/delete/{commentNo}")
  @ResponseBody
  private int commentDelete(@PathVariable int commentNo) throws Exception{
      return commentService.delete(commentNo);
  }

}
