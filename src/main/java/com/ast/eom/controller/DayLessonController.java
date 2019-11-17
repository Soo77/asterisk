package com.ast.eom.controller;

import java.sql.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ast.eom.domain.DayLesson;
import com.ast.eom.domain.Lesson;
import com.ast.eom.domain.Member;
import com.ast.eom.service.DayLessonService;
import com.ast.eom.service.LessonService;

@Controller
@RequestMapping("/dayLesson") 
public class DayLessonController {

  @Autowired private DayLessonService dayLessonService;
  @Autowired private LessonService lessonService;

  @GetMapping("list")
  public void list(
      Model model,
      HttpSession session,
      int lessonNo) throws Exception {
    int lessonDayCount = 0;
    int lessonState = 0;
    int totalHours = 0;
    int dayLessonNo = 0;
    int remainDays = 0;
    String percent;
    
    Lesson lesson = lessonService.get(lessonNo);
    totalHours = lesson.getCurriculum().getTotalHours();
    lessonDayCount = lesson.getLessonDayCount();
    lessonState = lesson.getLessonState();
    remainDays = totalHours - lessonDayCount;
    percent = String.format("%.2f", (double)lessonDayCount / (double)totalHours * 100);
    
    
    List<DayLesson> dayLessons = dayLessonService.list(lessonNo);
    if (dayLessons.size() > 0) {
      dayLessonNo = dayLessons.get(0).getDayLessonNo();
    }
    
    model.addAttribute("lessonNo", lessonNo);
    model.addAttribute("lessonDayCount", lessonDayCount);
    model.addAttribute("lessonState", lessonState);
    model.addAttribute("totalHours", totalHours);
    model.addAttribute("remainDays", remainDays);
    model.addAttribute("percent", percent);
    model.addAttribute("dayLessons", dayLessons);
    model.addAttribute("dayLessonNo", dayLessonNo);
    
  }
  
  @GetMapping("dayLesson/list")
  @ResponseBody
  public List<DayLesson> list(int lessonNo) throws Exception {
    return dayLessonService.list(lessonNo);
  }
  
  @PostMapping("dayLesson/add")
  @ResponseBody
  public int commentAdd(
      @RequestParam int lessonNo,
      @RequestParam Date lessonDate,
      @RequestParam String lessonStartHour,
      @RequestParam String lessonEndHour,
      @RequestParam String lessonSummary,
      @RequestParam String lessonEvaluation) throws Exception {
    DayLesson dayLesson = new DayLesson();
    dayLesson.setLessonNo(lessonNo);
    dayLesson.setLessonDate(lessonDate);
    dayLesson.setLessonStartHour(lessonStartHour);
    dayLesson.setLessonEndHour(lessonEndHour);
    dayLesson.setLessonSummary(lessonSummary);
    dayLesson.setLessonEvaluation(lessonEvaluation);
    
    return dayLessonService.insert(dayLesson);
  }

  @RequestMapping("dayLesson/update")
  @ResponseBody
  public int update(
      @RequestParam int dayLessonNo,
      @RequestParam Date lessonDate,
      @RequestParam String lessonStartHour,
      @RequestParam String lessonEndHour,
      @RequestParam String lessonSummary,
      @RequestParam String lessonEvaluation) throws Exception {
    DayLesson dayLesson = new DayLesson();
    dayLesson.setDayLessonNo(dayLessonNo);
    dayLesson.setLessonDate(lessonDate);
    dayLesson.setLessonStartHour(lessonStartHour);
    dayLesson.setLessonEndHour(lessonEndHour);
    dayLesson.setLessonSummary(lessonSummary);
    dayLesson.setLessonEvaluation(lessonEvaluation);
    return dayLessonService.update(dayLesson);
  }
  
  @RequestMapping("dayLesson/delete")
  @ResponseBody
  private int delete(@RequestParam  int dayLessonNo, @RequestParam int lessonNo) throws Exception{
      return dayLessonService.delete(dayLessonNo, lessonNo);
  }
  
  @GetMapping("stopLessonForm")
  public void stopLessonForm(
      Model model,
      HttpSession session,
      int lessonNo) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    int memberTypeNo = member.getMemberTypeNo();
    int memberNo = member.getMemberNo();
    String name = member.getName();
    String email = member.getEmail();
    
    List<Lesson> lessons = lessonService.list(memberTypeNo, memberNo);
    for (Lesson lesson : lessons) {
      if (lesson.getLessonNo() != lessonNo)
        continue;
      else {
        model.addAttribute("subjectName", lesson.getSubjectName());
        model.addAttribute("schoolTypeNo", lesson.getSubject().getSchoolTypeNo());
      }
    }
    
    Lesson lessonCurriculum = lessonService.get(lessonNo);
    
    model.addAttribute("totalHours", lessonCurriculum.getCurriculum().getTotalHours());
    model.addAttribute("lessonDayCount", lessonCurriculum.getLessonDayCount());
    model.addAttribute("lessonNo", lessonNo);
    model.addAttribute("name", name);
    model.addAttribute("email", email);
  }
  
  @PostMapping("stopLesson")
  public String stopLesson(
      HttpSession session,
      int lessonNo,
      String stopReason) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    int memberTypeNo = member.getMemberTypeNo();
    lessonService.interruptionRequest(memberTypeNo, lessonNo, stopReason);
    return "redirect:list?lessonNo=" + lessonNo;
  }
  
  @GetMapping("reviewForm")
  public void reviewForm(
      Model model,
      HttpSession session,
      int lessonNo) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    int memberTypeNo = member.getMemberTypeNo();
    model.addAttribute("memberTypeNo", memberTypeNo);
    model.addAttribute("lessonNo", lessonNo);
    
  }
}

