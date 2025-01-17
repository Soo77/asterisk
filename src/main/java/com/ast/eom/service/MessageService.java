package com.ast.eom.service;

import java.util.HashMap;
import java.util.List;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Message;

public interface MessageService {
  List<Member> messageList(int memberNo) throws Exception;
  int messageReadShowAll(int memberNo) throws Exception;
  Integer messageReadShow(Message message) throws Exception;
  void messageRead(Message message) throws Exception;
  List<Message> detail(int memberNo) throws Exception;
  List<Message> messageDetail(Message message) throws Exception;
  int messageIn(Message message, int lessonNo) throws Exception;
  List<Member> messageDetailInfo(int memberNo) throws Exception;
  List<Member> searchStd(String id) throws Exception;
  String lessonInvitationCheck(int lessonNo) throws Exception;
  void lessonInvitationStd(HashMap<String, Object> stat) throws Exception;
  Object readContsDate(HashMap<String, Object> no);
}
