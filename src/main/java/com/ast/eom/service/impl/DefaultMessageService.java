package com.ast.eom.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ast.eom.dao.MessageDao;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Message;
import com.ast.eom.service.MessageService;

@Service
public class DefaultMessageService implements MessageService {
  
  @Autowired
  MessageDao messageDao;

  @Override
  public List<Member> messageList(int memberNo) throws Exception {
    return messageDao.messageList(memberNo);
  }

  @Override
  public int messageReadShowAll(int memberNo) throws Exception {
    return messageDao.messageReadShowAll(memberNo);
  }

  @Override
  public Integer messageReadShow(Message message) throws Exception {
    return messageDao.messageReadShow(message);
  }

  @Override
  public void messageRead(Message message) throws Exception {
    messageDao.messageRead(message);
  }

  @Override
  public List<Message> detail(int memberNo) throws Exception {
    return messageDao.detail(memberNo);
  }

  @Override
  public List<Message> messageDetail(Message message) throws Exception {
    return messageDao.messageDetail(message);
  }

  @Override
  public int messageIn(Message message) throws Exception {
    return messageDao.messageIn(message);
  }

  @Override
  public List<Member> messageDetailInfo(int memberNo) throws Exception {
    return messageDao.messageDetailInfo(memberNo);
  }

}
