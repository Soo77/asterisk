package com.ast.eom.dao;

import java.util.List;
import java.util.Map;

import com.ast.eom.domain.Lesson;
import com.ast.eom.domain.LessonSubject;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Parents;
import com.ast.eom.domain.School;
import com.ast.eom.domain.Student;
import com.ast.eom.domain.Teacher;
import com.ast.eom.domain.TeacherPhoto;
import com.ast.eom.domain.WantedLesson;

public interface MypageDao {
  Member findBy(int memberNo) throws Exception;
  Teacher getTeacher(int memberNo) throws Exception;
  Student getStudent(int memberNo) throws Exception;
  Parents getParents(int memberNo) throws Exception;
  List<School> getSchools (int no) throws Exception;
  List<LessonSubject> getLessonSubjects(int memberNo) throws Exception;
  List<WantedLesson> getWantedLessons(int memberNo) throws Exception;
  List<Member> getChildrenIdAndName(List<Integer> childrenNo) throws Exception;
  List<TeacherPhoto> getTeacherPhotos(int memberNo) throws Exception;
  List<Lesson> getLessonsForTeacher(int memberNo) throws Exception;
  List<Lesson> getLessonsForStudent(int memberNo) throws Exception;
  int updateMember(Member member) throws Exception;
  int updateStudent(Student student) throws Exception;
  int updateTeacher(Teacher teacher) throws Exception;
  int deleteAllLessonSubjectRelatedTo(int memberNo) throws Exception;
  int insertLessonSubjectOf(Map<String, Object> teacherInfo) throws Exception;
  int insertWantedLessonOf(Map<String, Object> studentInfo) throws Exception;
  String[] getAllLessonSubjectContentsOf(int memberNo) throws Exception;
  int updateParentsOfStudent(Map<String, Object> childrenInfo) throws Exception;
  Member getChildBy(String childId) throws Exception;
  int deleteAllParentsNoOfStudents(int memberNo) throws Exception;
  int deleteAllWantedLessonRelatedTo(int memberNo) throws Exception;
  List<Parents> getParentsListWith(int memberTypeNo) throws Exception;
}
