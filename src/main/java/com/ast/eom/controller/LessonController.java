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
import org.springframework.web.bind.annotation.RequestMethod;
import com.ast.eom.domain.Curriculum;
import com.ast.eom.domain.CurriculumLessonContents;
import com.ast.eom.domain.Lesson;
import com.ast.eom.service.LessonService;
 
@Controller
@RequestMapping("/lesson")
public class LessonController {

  @Autowired private LessonService lessonService;
  
  
  @GetMapping("list")
  public void list(Model model, int memberTypeNo) throws Exception {
    System.out.println(memberTypeNo); 
    
      List<Lesson> lessons = lessonService.list(memberTypeNo);
      model.addAttribute("lessons", lessons);
  }
  
  @RequestMapping(value = "detail", method={RequestMethod.GET})
  public void detail(Model model, int lessonNo

      ) throws Exception {
    

    
    Lesson lesson = lessonService.lessonDetail(lessonNo);
    String whatDay = lesson.getCurriculum().getCurriculumLessonDay();
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
    
    lesson.setDayintoWord(resultDay);
    model.addAttribute("lesson", lesson);
  }
  
  
  
  @PostMapping("update")
  public String update(
      HttpSession session,
      int[] curriculumLessonNo,
      String[] lessonconts,
      int[] lessondays,
      Date sdt, Date edt, String st, String et,
      String[] weekArr,
      String[] deletedCurriculumLessonNo) throws Exception {

    System.out.println(lessonconts.length);
    StringBuilder sb = new StringBuilder();
    // lesson 요일 변경
    sb.append("0000000");
    for(int i = 0; i < weekArr.length; i++) {
      sb.setCharAt(Integer.parseInt(weekArr[i])-1, '1'); 
    } 
    
    int garoNo = (int) session.getAttribute("garo");//lessonNo 써서 다시 detail로 돌아가려고
    
    Lesson lesson2 = new Lesson();
    Curriculum curr2 = new Curriculum();
    lesson2.setLessonNo(garoNo);
    lesson2.setStartDate(sdt);
    lesson2.setEndDate(edt);
    curr2.setCurriculumLessonStartTime(st);
    curr2.setCurriculumLessonEndTime(et);
    curr2.setCurriculumLessonDay(sb.toString());
    lesson2.setCurriculum(curr2);
    lessonService.updateDateAndTime(lesson2);
    

    
    for (int i = 0; i < lessonconts.length; i++) {
      Lesson lesson = new Lesson();
      CurriculumLessonContents clc = new CurriculumLessonContents();
      Curriculum curr = new Curriculum();
      lesson.setLessonNo(garoNo);
      clc.setCurriculumLessonNo(curriculumLessonNo[i]);
      clc.setLessonContents(lessonconts[i]);
      clc.setLessonDays(lessondays[i]);
      lesson.setCurriculum(curr);
      lesson.setClc(clc);

      if (clc.getCurriculumLessonNo() == 0) {
        // 컨텐츠와 날짜 입력하는 메소드
        System.out.println(lesson);
        lessonService.addContentsAndDays(lesson);
      } else {
        lessonService.updateContentsAndDays(lesson);
        
      }
      if (deletedCurriculumLessonNo != null) {
        for(String d : deletedCurriculumLessonNo) {
          System.out.println("값: " + d);
          int num = Integer.parseInt(d);
          lessonService.deleteContentsAndDays(num);
        } 
      }
      
      
    }
    
    return "redirect:detail?lessonNo="+garoNo;
  }
  
  
  @GetMapping("currAdd")
  public void currAdd(
      HttpSession session,
      int[] curriculumLessonNo,
      String[] lessonconts,
      int[] lessondays,
      Date sdt, Date edt, String st, String et,
      String[] weekArr,
      String[] deletedCurriculumLessonNo) throws Exception {
    
    
    
  }
}
