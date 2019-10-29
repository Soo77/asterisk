package com.ast.eom.domain;

import java.util.List;

public class Parents extends Member {
  private int parentsNo;
  private boolean kakaotalk;
  
  private List<Student> students;

  @Override
  public String toString() {
    return "Parents [parentsNo=" + parentsNo + ", kakaotalk=" + kakaotalk + ", students=" + students + "]";
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
  public List<Student> getStudents() {
    return students;
  }
  public void setStudents(List<Student> students) {
    this.students = students;
  }
}
