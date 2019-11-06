package com.ast.eom.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
  
  @GetMapping("findmember")
  public void findmember(Model model) throws Exception {
    List<Member> member = messageDao.findmember();
    model.addAttribute("findMember", member);
  }

  @GetMapping("detail")
  public List<Message> detail(Model model, int memberNo) throws Exception {
    List<Message> message = messageDao.detail(memberNo);
    model.addAttribute("receiverNo", memberNo);
    System.out.println(memberNo);
    System.out.println(message);
    return message;
  }

  @PostMapping("memberlist")
  @ResponseBody
  public List<Member> memberlist(int memberNo) throws Exception {
    List<Member> message = messageDao.messageList(memberNo);
    System.out.println(memberNo);
    for (Member m : message) {
      System.out.println(m);
    }
    return message;
  }

  @PostMapping("messageDetail")
  @ResponseBody
  public List<Message> messageDetail(int senderNo, int receiverNo) throws Exception {
    System.out.println(senderNo);
    System.out.println(receiverNo);
    
    Message message = new Message();
    message.setSenderNo(senderNo);
    message.setReceiverNo(receiverNo);
    
    List<Message> messageList = messageDao.messageDetail(message);
    return messageList;
  }

  @PostMapping("messagein")
  @ResponseBody
  public int messagein(int receiverNo, int senderNo, String messageConts) throws Exception {
    Message message = new Message();
    message.setReceiverNo(receiverNo);
    message.setSenderNo(senderNo);
    message.setMessageContents(messageConts);

    return messageDao.messageIn(message);
  }
}