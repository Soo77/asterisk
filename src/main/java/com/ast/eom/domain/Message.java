package com.ast.eom.domain;

import java.sql.Date;

public class Message {
  private int messageNo;
  private Member sender;
  private Member receiver;
  private String messageContents;
  private Date sendDate;
  private Date readDate;
  
  public int getMessageNo() {
    return messageNo;
  }
  public void setMessageNo(int messageNo) {
    this.messageNo = messageNo;
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
  public Date getReadDate() {
    return readDate;
  }
  public void setReadDate(Date readDate) {
    this.readDate = readDate;
  }
}
