package com.ast.eom.domain;

public class Parents {
  private int parentsNo;
  private boolean kakaotalk;
  
  @Override
  public String toString() {
    return "Parents [parentsNo=" + parentsNo + ", kakaotalk=" + kakaotalk + "]";
  }
  public int getParentsNo() {
    return parentsNo;
  }
  public void setParentsNo(int parentsNo) {
    this.parentsNo = parentsNo;
  }
  public boolean isKakaotalk() {
    return kakaotalk;
  }
  public void setKakaotalk(boolean kakaotalk) {
    this.kakaotalk = kakaotalk;
  }
}
