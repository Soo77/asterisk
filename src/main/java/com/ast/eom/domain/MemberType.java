package com.ast.eom.domain;

import java.io.Serializable;

public class MemberType implements Serializable {
  private static final long serialVersionUID = 1L;

  int no;
  String memberType;
  
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public String getMemberType() {
    return memberType;
  }
  public void setMemberType(String memberType) {
    this.memberType = memberType;
  }
  
  
}
