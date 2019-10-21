package com.ast.eom.domain;

public class MemberType {
  private int no;
  private String memberType;
  
  @Override
  public String toString() {
    return "MemberType [no=" + no + ", memberType=" + memberType + "]";
  }
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
