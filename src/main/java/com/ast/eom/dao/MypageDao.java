package com.ast.eom.dao;

import java.util.List;

import com.ast.eom.domain.Member;
import com.ast.eom.domain.Parents;
import com.ast.eom.domain.School;
import com.ast.eom.domain.Student;
import com.ast.eom.domain.Teacher;

public interface MypageDao {
  Member findBy(int no) throws Exception;
  Teacher getTeacher(int no) throws Exception;
  Student getStudent(int no) throws Exception;
  Parents getParents(int no) throws Exception;
  List<School> getSchools (int no) throws Exception;
}
