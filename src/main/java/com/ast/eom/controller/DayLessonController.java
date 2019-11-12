package com.ast.eom.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ast.eom.domain.DayLesson;
import com.ast.eom.service.DayLessonService;

@Controller
@RequestMapping("/dayLesson") public class DayLessonController {

  @Autowired private DayLessonService dayLessonService;

  @GetMapping("list") public void list(Model model) throws Exception {
    int lessonNo = 4;
    List<DayLesson> dayLessons = dayLessonService.list(lessonNo);
    model.addAttribute("dayLessons",
        dayLessons);
  }

  @GetMapping("detail") public void detail(Model model, int dayLessonNo) throws Exception {
    DayLesson dayLesson = dayLessonService.get(dayLessonNo);
    model.addAttribute("dayLesson", dayLesson);
  }

  @PostMapping("update") public String update(DayLesson dayLesson) throws Exception {
    dayLessonService.update(dayLesson);
    return "redirect:list";
  }

}

