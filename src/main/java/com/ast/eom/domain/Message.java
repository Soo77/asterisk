package com.ast.eom.domain;

import java.sql.Date;

public class Message {
  private int messageNo;
  private String messageContents;
  private Date sendDate;
  private boolean isRead;
  
  private Member sender;
  private Member receiver;
  
  @Override
  public String toString() {
    return "Message [messageNo=" + messageNo + ", messageContents=" + messageContents + ", sendDate=" + sendDate
        + ", isRead=" + isRead + ", sender=" + sender + ", receiver=" + receiver + "]";
  }
  public int getMessageNo() {
    return messageNo;
  }
  public void setMessageNo(int messageNo) {
    this.messageNo = messageNo;
  }
  public String getMessageContents() {
    return messageContents;
  }
  public void setMessageContents(String messageContents) {
    this.messageContents = messageContents;
  }
  public Date getSendDate() {
    return sendDate;
  }
  public void setSendDate(Date sendDate) {
    this.sendDate = sendDate;
  }
  public boolean isRead() {
    return isRead;
  }
  public void setRead(boolean isRead) {
    this.isRead = isRead;
  }
  public Member getSender() {
    return sender;
  }
  public void setSender(Member sender) {
    this.sender = sender;
  }
  public Member getReceiver() {
    return receiver;
  }
  public void setReceiver(Member receiver) {
    this.receiver = receiver;
  }
}
