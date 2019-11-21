package com.ast.eom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Message;
import com.ast.eom.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {

  @Autowired
  MessageService messageService;
  
  @GetMapping("notice")
  @ResponseBody
  public Object notice(HttpSession session) throws Exception {
    Member member = (Member)session.getAttribute("loginUser");
    
    if(member == null) {
      return null;
    }
    return messageService.messageReadShowAll(member.getMemberNo());
  }
    
  @GetMapping("list")
  public void list(HttpSession session, Model model) throws Exception {
    Member member = (Member)session.getAttribute("loginUser");
    session.setAttribute("messageReadShowAll", messageService.messageReadShowAll(member.getMemberNo()));

    List<Member> message = messageService.messageList(member.getMemberNo());
    model.addAttribute("messageMem", message);
    model.addAttribute("messageListSize", message.size());
    Message messageReadShow = new Message();
    ArrayList<Integer> messageReadList = new ArrayList<>();
    
    for(int i=0; i<message.toArray().length; i++) {
      messageReadShow.setSenderNo(message.get(i).getMemberNo());
      messageReadShow.setReceiverNo(member.getMemberNo());
      
      messageReadList.add(messageService.messageReadShow(messageReadShow));
    }
    model.addAttribute("messageReadList", messageReadList);
  }

  @GetMapping("detail")
  public void detail(HttpSession session, Model model, int memberNo) throws Exception {
    List<Member> messageDetailInfo = messageService.messageDetailInfo(memberNo);
    model.addAttribute("messageInfo", messageDetailInfo);
    System.out.println(messageDetailInfo);
    
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
  public int messagein(int receiverNo, int senderNo, String messageConts, int lessonNo) throws Exception {
    Message message = new Message();
    message.setReceiverNo(receiverNo);
    message.setSenderNo(senderNo);
    message.setMessageContents(messageConts);

    return messageService.messageIn(message, lessonNo);
  }
  
  @PostMapping("searchStd")
  @ResponseBody
  public List<Member> searchStd(String id) throws Exception {
    return messageService.searchStd(id);
  }
  
  @PostMapping("lessonInvitationCheck")
  @ResponseBody
  public String lessonInvitationCheck(int lessonNo) throws Exception {
    return messageService.lessonInvitationCheck(lessonNo);
  }
  
  @PostMapping("lessonInvitationStd")
  @ResponseBody
  public void lessonInvitationStd(int stdNo, int lessonNo) throws Exception {
	HashMap<String, Object> stat = new HashMap<>();
	stat.put("stdNo", stdNo);
	stat.put("lessonNo", lessonNo);
	
	messageService.lessonInvitationStd(stat);
  }
}
