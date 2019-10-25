package com.ast.eom.dao;

import java.util.List;
import com.ast.eom.domain.Subject;

// DAO 사용 규칙을 정의한다.
public interface SubjectDao {
  List<Subject> listSubject() throws Exception;
  Subject detailSubject(int no) throws Exception;
  }







