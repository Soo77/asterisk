package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Message;

public interface MessageDao {

  List<Member> messageList(int memberNo) throws Exception;
  List<Message> messageDetail(int memberNo) throws Exception;
  int messageIn(Message message) throws Exception;
}
