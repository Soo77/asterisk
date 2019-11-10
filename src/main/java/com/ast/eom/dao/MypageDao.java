package com.ast.eom.dao;

import java.util.List;

import com.ast.eom.domain.LessonSubject;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Parents;
import com.ast.eom.domain.School;
import com.ast.eom.domain.Student;
import com.ast.eom.domain.Teacher;
import com.ast.eom.domain.WantedLesson;

public interface MypageDao {
  Member findBy(int memberNo) throws Exception;
  Teacher getTeacher(int memberNo) throws Exception;
  Student getStudent(int memberNo) throws Exception;
  Parents getParents(int memberNo) throws Exception;
  List<School> getSchools (int no) throws Exception;
  List<LessonSubject> getLessonSubjects(int memberNo);
  List<WantedLesson> getWantedLessons(int memberNo);
  List<Member> getChildrenIdAndName(List<Integer> childrenNo);
}
