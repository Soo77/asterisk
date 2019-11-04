package com.ast.eom.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ast.eom.dao.MessageDao;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Message;

@Controller
@RequestMapping("/message")
public class MessageController {
  
  @Autowired
  MessageDao messageDao;
  
  @GetMapping("list")
  public void list() throws Exception {
  }
  
  @GetMapping("detail")
  public List<Message> detail(int memberNo) throws Exception {
    List<Message> message = messageDao.messageDetail(memberNo);
    System.out.println(memberNo);
    System.out.println(message);
    return message;
  }
  
  @PostMapping("memberlist")
  @ResponseBody
  public List<Member> memberlist(HttpSession session, int memberNo) throws Exception {
    List<Member> message = messageDao.messageList(memberNo);
//    session.setAttribute("memNo", message);
    System.out.println(memberNo);
    for (Member m : message) {
      System.out.println(m);
    }
    return message;
  }
  
  @PostMapping("messageDetail")
  @ResponseBody
  public List<Message> messageDetail(int memberNo) throws Exception {
    List<Message> message = messageDao.messageDetail(memberNo);
    System.out.println(memberNo);
    System.out.println(message);
    return message;
  }
  
  @PostMapping("messagein")
  @ResponseBody
  public int messagein(HttpSession session, String messageConts) throws Exception {
//    int memberNo = (int) session.getAttribute("loginUser.memberNo");
//    System.out.println(memberNo+"dsa");
    Message message = new Message();
    message.setSenderNo(1);
    message.setMessageContents(messageConts);
    
    return messageDao.messageIn(message);
  }
}
