package com.ast.eom.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ast.eom.dao.MessageDao;
import com.ast.eom.domain.Message;

@Controller
@RequestMapping("/message")
public class MessageController {
  
  @Autowired
  MessageDao messageDao;
  
  @GetMapping("message")
  public void message() {
  }
  
  @GetMapping("messagelist")
  @ResponseBody
  public void messagelist(HttpSession session, int memberNo) throws Exception {
    Message message = messageDao.messageList(memberNo);
    session.setAttribute("sendMessage", message);
  }
  
  @PostMapping("messagein")
  @ResponseBody
  public void messagein(int memberNo, String messageConts) throws Exception {
    Message message = new Message();
    message.setSenderNo(memberNo);
    message.setMessageContents(messageConts);
    
    messageDao.messageIn(message);
  }
}
