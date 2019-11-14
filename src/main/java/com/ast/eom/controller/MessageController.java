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
  MessageDao messageDao;

  @GetMapping("list")
  public void list() throws Exception {
  }

  @GetMapping("detail")
  public List<Message> detail(Model model, int memberNo) throws Exception {
    List<Message> message = messageDao.detail(memberNo);
    model.addAttribute("receiverNo", memberNo);
    return message;
  }

  @PostMapping("memberlist")
  @ResponseBody
  public List<Member> memberlist(HttpSession session, int memberNo) throws Exception {
    List<Member> message = messageDao.messageList(memberNo);
    session.setAttribute("messageReadShowAll", messageDao.messageReadShowAll(memberNo));
    
    Message messageReadShow = new Message();
    ArrayList<Integer> messageReadList = new ArrayList<>();
    
    for(int i=0; i<message.toArray().length; i++) {
      messageReadShow.setSenderNo(message.get(i).getMemberNo());
      messageReadShow.setReceiverNo(memberNo);
      
      if(memberNo == message.get(i).getMemberNo()) {
        messageReadList.add(0);
      } else {
        messageReadList.add(messageDao.messageReadShow(messageReadShow));
      }
    }
    session.setAttribute("messageReadList", messageReadList);
    return message;
  }

  @PostMapping("messageDetail")
  @ResponseBody
  public List<Message> messageDetail(int senderNo, int receiverNo) throws Exception {
    Message message = new Message();
    message.setSenderNo(senderNo);
    message.setReceiverNo(receiverNo);

    List<Message> messageList = messageDao.messageDetail(message);
    messageDao.messageRead(message);
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
