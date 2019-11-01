package com.ast.eom.dao;

import com.ast.eom.domain.Message;

public interface MessageDao {

  Message messageList(int memberNo) throws Exception;
  Message messageIn(Message message) throws Exception;
}
