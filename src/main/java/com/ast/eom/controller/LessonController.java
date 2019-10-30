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
  public void list(Model model, int memberTypeNo) throws Exception {
      List<Lesson> lessons = lessonService.list(memberTypeNo);
      model.addAttribute("lessons", lessons);
  }
}
