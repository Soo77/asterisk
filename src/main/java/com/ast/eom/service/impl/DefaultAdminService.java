package com.ast.eom.service.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ast.eom.dao.AdminDao;
import com.ast.eom.dao.LessonDao;
import com.ast.eom.dao.MypageDao;
import com.ast.eom.domain.Lesson;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.MemberTeacherStudent;
import com.ast.eom.domain.Pagination;
import com.ast.eom.domain.Parents;
import com.ast.eom.domain.Student;
import com.ast.eom.service.AdminService;
import com.ast.eom.service.MemberTeacherStudentService;

@Service
public class DefaultAdminService implements AdminService {
  @Autowired
  AdminDao adminDao;
  @Autowired
  MypageDao mypageDao;
  @Autowired
  LessonDao lessonDao;
  @Autowired
  MemberTeacherStudentService memberTeacherStudentService;
  
  int pageSize;
  int curPage;
  
  HttpSession session;
  
  public DefaultAdminService(HttpSession session) {
    this.session = session;
  }
  
  private void prepareBasicMemberInfoMapOf(
      int memberTypeNo, Map<String, Object> memberInfoMapForAdmin) throws Exception {
    
    List<Member> memberList = adminDao.getBasicMemberInfo(memberTypeNo);
    List<Integer> memberAge = new ArrayList<>();
    
    int thisYear, memberYear, age;
    String todayStr;
    
    for (Member member : memberList) {
      todayStr = String.valueOf(new Date(System.currentTimeMillis()));
      thisYear = Integer.parseInt(todayStr.substring(0,4));
      
      memberYear = Integer.parseInt(
          String.valueOf(member.getDateOfBirth()).substring(0,4));
      
      age = thisYear - memberYear + 1;
      memberAge.add(age);
    }
    
    memberInfoMapForAdmin.put("memberList", memberList);
    memberInfoMapForAdmin.put("memberAge", memberAge);
    
    List<MemberTeacherStudent> memberInfoList = null;
    List<Parents> parentsInfoList = null;
    int listCnt = -1;
    
    if (memberTypeNo == 1) { 
      memberInfoList = memberTeacherStudentService.list2(memberTypeNo); 
      listCnt = memberInfoList.size();
      
    } else if (memberTypeNo == 2) { 
      parentsInfoList = mypageDao.getParentsListWith(memberTypeNo);
      for (int i = 0; i < parentsInfoList.size(); i++) {
        Parents parents = mypageDao.getParents(
            parentsInfoList.get(i).getParentsNo());
        
        List<Student> children = parents.getStudents();
        List<Integer> childrenNo = new ArrayList<>();
        
        for (Student child : children) {
          childrenNo.add(child.getStudentNo());
        }
        
        List<Member> member = mypageDao.getChildrenIdAndName(childrenNo);
        if (member.size() > 0) {
          for (int j = 0; j < children.size(); j++) {
            children.get(j).setId(member.get(j).getId());
            children.get(j).setName(member.get(j).getName());
          }
          parents.setStudents(children);
        }
        
        parentsInfoList.set(i, parents);
        listCnt = parentsInfoList.size();
      }
    } else if (memberTypeNo == 3) { 
      memberInfoList = memberTeacherStudentService.list(memberTypeNo);
      listCnt = memberInfoList.size();
    }

    Pagination pagination = new Pagination(listCnt, curPage, pageSize);
    
    memberInfoMapForAdmin.put("memberInfoList", memberInfoList);
    memberInfoMapForAdmin.put("parentsInfoList", parentsInfoList);
    memberInfoMapForAdmin.put("memberTypeNo", memberTypeNo);
    memberInfoMapForAdmin.put("listCnt", listCnt);
    memberInfoMapForAdmin.put("pagination", pagination);
    memberInfoMapForAdmin.put("pageSize", pageSize);
    
  }
  
  @Override
  public Object loadMemberInfoMapOf(
      int memberTypeNo, int pageSize, int curPage) throws Exception {
    
    this.pageSize = pageSize;
    this.curPage = curPage;
    
    Map<String, Object> memberInfoMapForAdmin = new HashMap<>();
    
    if (memberTypeNo == 1) {
      prepareBasicMemberInfoMapOf(memberTypeNo,memberInfoMapForAdmin);
      return memberInfoMapForAdmin;
      
    } else if (memberTypeNo == 2) {
      prepareBasicMemberInfoMapOf(memberTypeNo, memberInfoMapForAdmin);
      return memberInfoMapForAdmin;
      
    } else if (memberTypeNo == 3) {
      prepareBasicMemberInfoMapOf(memberTypeNo, memberInfoMapForAdmin);
      return memberInfoMapForAdmin;
      
    } else if (memberTypeNo == 99) {
      return memberInfoMapForAdmin;
      
    } else {
      throw new Exception("잘못된 방식의 요청입니다!");
      
    }
    
  }
  
  @Override
  public Map<String, Object> getInfoMap(
      int memberNo,
      int memberTypeNo) throws Exception {
    
    Member thisMember = adminDao.getMember(memberNo);
    thisMember.setMemberTypeNo(thisMember.getMemberType().getMemberTypeNo());
    session.setAttribute("thisMember", thisMember);

    String[] memberEmail = thisMember.getEmail().split("@");
    session.setAttribute("memberEmail", memberEmail);
    
    Map<String, Object> memberInfoMapForDetail = new HashMap<>();
    
    if (memberTypeNo == 1) {
      memberInfoMapForDetail.put("student", mypageDao.getStudent(memberNo));
      memberInfoMapForDetail.put("wantedLessons", mypageDao.getWantedLessons(memberNo));
      memberInfoMapForDetail.put("studentLessons", mypageDao.getLessonsForStudent(memberNo));
      
    } else if (memberTypeNo == 2) {
      Parents parents = mypageDao.getParents(memberNo);
      List<Student> children = parents.getStudents();
      List<Integer> childrenNo = new ArrayList<>();
      for (Student child : children) {
        childrenNo.add(child.getStudentNo());
      }
      
      List<Member> member = mypageDao.getChildrenIdAndName(childrenNo);
      if (member.size() > 0) {
        for (int i = 0; i < children.size(); i++) {
          children.get(i).setId(member.get(i).getId());
          children.get(i).setName(member.get(i).getName());
        }
        parents.setStudents(children);
      }
      
      memberInfoMapForDetail.put("parents", parents);
      
    } else if (memberTypeNo == 3) {
      memberInfoMapForDetail.put("teacher", mypageDao.getTeacher(memberNo));
      memberInfoMapForDetail.put("teacherLessons", mypageDao.getLessonsForTeacher(memberNo));
      memberInfoMapForDetail.put("lessonSubjects", mypageDao.getLessonSubjects(memberNo));
      memberInfoMapForDetail.put("teacherPhotos", mypageDao.getTeacherPhotos(memberNo));
    }
    
    return memberInfoMapForDetail;
  }
  
  @Override
  public Map<String, Object> getPendingLessons() throws Exception {
    Map<String, Object> pendingLessonsInfoMap = new HashMap<>();
    List<Lesson> pendingLessons = adminDao.getPendingLessons();
    List<Member> studentList = new ArrayList<>();
    List<Member> teacherList = new ArrayList<>();
    
    for (Lesson pl : pendingLessons) {
      studentList.add(adminDao.getMember(pl.getStudentNo()));
      teacherList.add(adminDao.getMember(pl.getTeacherNo()));
    }
    
    pendingLessonsInfoMap.put("pendingLessons", pendingLessons);
    pendingLessonsInfoMap.put("studentList", studentList);
    pendingLessonsInfoMap.put("teacherList", teacherList);
    
    return pendingLessonsInfoMap;
  }
  
  @Override
  public Map<String, Object> getPendingLessonsInfoMap(
      int lessonNo) throws Exception {
    Map<String, Object> pendingLessonsInfoMapDetail = new HashMap<>();
    
    Lesson lessonInfo = lessonDao.findCurrBy(lessonNo);
    
    // 월 수업료
    int lessonFee = lessonInfo.getLessonFee();
    System.out.println("1. 수업료_lessonFee===> "+lessonFee);
    
    // 과외 총 수업일
    int lessonTotalDay = lessonInfo.getCurriculum().getTotalHours();
    System.out.println("2. 과외총요일_lessonTotalDay===> "+lessonTotalDay);
    
    // 과외의 총 달수
    Date startDate = lessonInfo.getStartDate();
    Date endDate = lessonInfo.getEndDate();
    double diff = endDate.getTime() - startDate.getTime();
    double diffDays = diff / (24 * 60 * 60 * 1000); // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
    System.out.println("3. 총 몇일" + diffDays);
    int lessonTotalMonth = (int)Math.ceil(diffDays / 28);
    System.out.println("4. 몇달_lessonTotalMonth===> "+lessonTotalMonth);
    
    // 한달 수업일
    int dayLessonCountOfMonth = (int) (lessonInfo.getCurriculum().getTotalHours() / lessonTotalMonth);
    System.out.println("5. 한달의총수업일_dayLessonCountOfMonth===> "+dayLessonCountOfMonth);
    
    // 정산일을 기준으로 한달 동안 진행된 수업 일수를 구함
    Date calculationDay = lessonInfo.getCalculationDay();
    
    String dt = String.valueOf(calculationDay);
    System.out.println("7. 정산 날짜_dt====>" + dt);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Calendar c = Calendar.getInstance();
    c.setTime(sdf.parse(dt));
    c.add(Calendar.DATE, 30);  //30일을 더해준다.
    Date after30days = Date.valueOf(sdf.format(c.getTime()));
    System.out.println("8. 정산일에서 30일 후_after30days===>"+after30days);

    HashMap<String, Object> params = new HashMap<>();
    params.put("calculationDay", calculationDay);
    params.put("after30days", after30days);
    params.put("lessonNo", lessonNo);
    int progressDayLessonCountOfMonth = adminDao.countLessonDays(params);
    System.out.println("9. 한달동안진행된수업일수_progressDayLessonCountOfMonth===> "+progressDayLessonCountOfMonth);
    
    // 환불 금액 = 월수업료 / (총 수업일/총 달수) * 잔여일수
    long refund = lessonFee / (lessonTotalDay / lessonTotalMonth)
        * (dayLessonCountOfMonth - progressDayLessonCountOfMonth);
    System.out.println("10. 환불금액_refund===> "+refund);
    Member studentInfo = adminDao.getMember(lessonInfo.getStudentNo());
    Member teacherInfo = adminDao.getMember(lessonInfo.getTeacherNo());
    
    pendingLessonsInfoMapDetail.put("lessonInfo", lessonInfo);
    pendingLessonsInfoMapDetail.put("studentInfo", studentInfo);
    pendingLessonsInfoMapDetail.put("teacherInfo", teacherInfo);
    pendingLessonsInfoMapDetail.put("dayLessonCountOfMonth", dayLessonCountOfMonth);
    pendingLessonsInfoMapDetail.put("progressDayLessonCountOfMonth", progressDayLessonCountOfMonth);
    pendingLessonsInfoMapDetail.put("refund", refund);
    
    return pendingLessonsInfoMapDetail;
  }
  
  @Override
  public int approveInterruption(int lessonNo) throws Exception {
    adminDao.approveInterruption(lessonNo);
    return 1;
  }
  
  @Override
  public int approve(int teacherNo) throws Exception {
    adminDao.approveTeacherCertificationOf(teacherNo);
    return 1;
  }
  
  @Override
  public int accept(int memberNo) throws Exception {
    adminDao.acceptThis(memberNo);
    return 1;
  }
  
  @Override
  public int reject(int memberNo) throws Exception {
    adminDao.rejectThis(memberNo);
    return 1;
  }
  
}
