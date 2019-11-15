package com.ast.eom.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
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
  MessageDao messageService;
  
  @GetMapping("list")
  public void list(HttpSession session, Model model) throws Exception {
    Member member = (Member)session.getAttribute("loginUser");
    model.addAttribute("messageReadShowAll", messageService.messageReadShowAll(member.getMemberNo()));

    List<Member> message = messageService.messageList(member.getMemberNo());
    model.addAttribute("messageMem", message);
    model.addAttribute("messageListSize", message.size());
    Message messageReadShow = new Message();
    ArrayList<Integer> messageReadList = new ArrayList<>();
    
    for(int i=0; i<message.toArray().length; i++) {
      messageReadShow.setSenderNo(message.get(i).getMemberNo());
      messageReadShow.setReceiverNo(member.getMemberNo());
      
      if(member.getMemberNo() == message.get(i).getMemberNo()) {
        messageReadList.add(0);
      } else {
        messageReadList.add(messageService.messageReadShow(messageReadShow));
      }
    }
    model.addAttribute("messageReadList", messageReadList);
  }

  @GetMapping("detail")
  public void detail(HttpSession session, Model model, int memberNo) throws Exception {
    messageService.detail(memberNo);
    model.addAttribute("receiverNo", memberNo);
    
    Member member = (Member)session.getAttribute("loginUser");
    Message message = new Message();
    
    message.setSenderNo(member.getMemberNo());
    message.setReceiverNo(memberNo);
    
    model.addAttribute("messageList", messageService.messageDetail(message));
    messageService.messageRead(message);
  }

  @PostMapping("messagein")
  @ResponseBody
  public int messagein(int receiverNo, int senderNo, String messageConts) throws Exception {
    Message message = new Message();
    message.setReceiverNo(receiverNo);
    message.setSenderNo(senderNo);
    message.setMessageContents(messageConts);

    return messageService.messageIn(message);
  }
  
  @GetMapping("studentFind")
  public void studentFind() {
  }
  
  @Autowired
  MessageDao messageDao;
  
  @PostMapping("searchStd")
  @ResponseBody
  public List<Member> searchStd(String id) throws Exception {
    return messageDao.searchStd(id);
  }
  
  @PostMapping("invitation")
  public void invitation(int memberNo) throws Exception {
    System.out.println(memberNo);
  }
}
