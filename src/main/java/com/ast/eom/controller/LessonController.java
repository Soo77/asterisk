package com.ast.eom.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ast.eom.domain.Lesson;
import com.ast.eom.service.LessonService;

@Controller
@RequestMapping("/lesson")
public class LessonController {

  @Autowired private LessonService lessonService;
  
  
  @GetMapping("list")
  public void tchList(Model model, int memberTypeNo) throws Exception {
      List<Lesson> lessons = lessonService.list(memberTypeNo);
      model.addAttribute("lessons", lessons);
  }
  
  @GetMapping("detail")
  public void detail(Model model, int lessonNo) throws Exception {
    Lesson lesson = lessonService.lessonDetail(lessonNo);
    String whatDay = lesson.getCurriculum().getCurrentLessonDay();
    System.out.println(whatDay);
    
    String resultDay = "";
    
    if (whatDay.charAt(0) == '1') {
      resultDay = resultDay + "월";
    }
    if (whatDay.charAt(1) == '1') {
      if (resultDay != "") {
        resultDay = resultDay + ",";
      }
      resultDay = resultDay + "화";
    }
    if (whatDay.charAt(2) == '1') {
      if (resultDay != "") {
        resultDay = resultDay + ",";
      }
      resultDay = resultDay + "수";
    }
    if (whatDay.charAt(3) == '1') {
      if (resultDay != "") {
        resultDay = resultDay + ",";
      }
      resultDay = resultDay + "목";
    }
    if (whatDay.charAt(4) == '1') {
      if (resultDay != "") {
        resultDay = resultDay + ",";
      }
      resultDay = resultDay + "금";
    }
    if (whatDay.charAt(5) == '1') {
      if (resultDay != "") {
        resultDay = resultDay + ",";
      }
      resultDay = resultDay + "토";
    }
    if (whatDay.charAt(6) == '1') {
      if (resultDay != "") {
        resultDay = resultDay + ",";
      }
      resultDay = resultDay + "일";
    }
    
    
    System.out.println(resultDay);
    lesson.getCurriculum().setCurrentLessonDay(resultDay);
    System.out.println(lesson.getCurriculum().getCurrentLessonDay());
    

    
    model.addAttribute("lesson", lesson);
  }

}
