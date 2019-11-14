package com.ast.eom.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ast.eom.domain.DayLesson;
import com.ast.eom.service.DayLessonService;

@Controller
@RequestMapping("/dayLesson") 
public class DayLessonController {

  @Autowired private DayLessonService dayLessonService;

  @GetMapping("list")
  public void list(HttpSession session, Model model, int lessonNo) throws Exception {
    List<DayLesson> dayLessons = dayLessonService.list(lessonNo);
    model.addAttribute("dayLessons", dayLessons);
    model.addAttribute("lessonNo", lessonNo);
    
//    Map<String, Object> memberInfoMap = (Map<String, Object>) session.getAttribute("memberInfoMap");
//    List<Lesson> teacherLessons = (List<Lesson>) memberInfoMap.get("teacherLessons");
//    for (Lesson lesson : teacherLessons) {
//      System.out.println(lesson);
//    }
  }
  
  @GetMapping("detail")
  public void detail(Model model, int dayLessonNo) throws Exception {
    DayLesson dayLesson = dayLessonService.get(dayLessonNo);
    model.addAttribute("dayLesson", dayLesson);
  }

  
  @GetMapping("dayLesson/list")
  @ResponseBody
  public List<DayLesson> list(int lessonNo) throws Exception {
    System.out.println(lessonNo);
    return dayLessonService.list(lessonNo);
  }

  @RequestMapping("dayLesson/update")
  @ResponseBody
  public int update(@RequestParam int dayLessonNo, @RequestParam String lessonSummary, @RequestParam String lessonEvaluation)
      throws Exception {
    DayLesson dayLesson = new DayLesson();
    dayLesson.setDayLessonNo(dayLessonNo);
    dayLesson.setLessonSummary(lessonSummary);
    dayLesson.setLessonEvaluation(lessonEvaluation);
    return dayLessonService.update(dayLesson);
  }


}

