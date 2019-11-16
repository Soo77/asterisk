package com.ast.eom.controller;

import java.sql.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
      HttpSession session,
      Model model,
      int lessonNo) throws Exception {
    List<DayLesson> dayLessons = dayLessonService.list(lessonNo);
    
    if (dayLessons.size() > 0) {
      int dayLessonNo = dayLessons.get(0).getDayLessonNo();
      model.addAttribute("dayLessonNo", dayLessonNo);
    }
    
    model.addAttribute("dayLessons", dayLessons);
    model.addAttribute("lessonNo", lessonNo);
    
//    Map<String, Object> memberInfoMap = (Map<String, Object>) session.getAttribute("memberInfoMap");
//    List<Lesson> teacherLessons = (List<Lesson>) memberInfoMap.get("teacherLessons");
//    for (Lesson lesson : teacherLessons) {
//      System.out.println(lesson);
//    }
  }
  
//  @GetMapping("detail")
//  public void detail(Model model, int dayLessonNo) throws Exception {
//    DayLesson dayLesson = dayLessonService.get(dayLessonNo);
//    model.addAttribute("dayLesson", dayLesson);
//  }

  
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
  
  @RequestMapping("dayLesson/delete/{dayLessonNo}")
  @ResponseBody
  private int delete(@PathVariable int dayLessonNo) throws Exception{
      return dayLessonService.delete(dayLessonNo);
  }
  
  @GetMapping("stop_lesson")
  public void stop_lesson(
      Model model,
      HttpSession session,
      int memberTypeNo,
      int lessonNo) throws Exception {
    Member member = (Member) session.getAttribute("loginUser");
    String name = member.getName();
    String email = member.getEmail();
    
    List<Lesson> lessons = lessonService.list(memberTypeNo);
    for (Lesson lesson : lessons) {
      if (lesson.getLessonNo() != lessonNo)
        continue;
      else {
//        System.out.println("lesson===>" + lesson);
        model.addAttribute("subjectName", lesson.getSubjectName());
        model.addAttribute("schoolTypeNo", lesson.getSubject().getSchoolTypeNo());
      }
    }
    
    Lesson lessonCurriculum = lessonService.get(lessonNo);
//    System.out.println(lessonCurriculum.getCurriculum().getTotalHours());
    model.addAttribute("totalHours", lessonCurriculum.getCurriculum().getTotalHours());
    model.addAttribute("name", name);
    model.addAttribute("email", email);
  }

}

