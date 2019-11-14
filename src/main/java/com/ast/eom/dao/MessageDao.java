package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Message;

public interface MessageDao {

  List<Member> messageList(int memberNo) throws Exception;
  int messageReadShowAll(int memberNo) throws Exception;
  Integer messageReadShow(Message message) throws Exception;
  void messageRead(Message message) throws Exception;
  List<Message> detail(int memberNo) throws Exception;
  List<Message> messageDetail(Message message) throws Exception;
  int messageIn(Message message) throws Exception;
}
