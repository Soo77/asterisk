package com.ast.eom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ast.eom.service.MainPageService;

@Controller
@RequestMapping("/main")
public class MainPageController {
  
  @Autowired
  MainPageService mainPageService;
  
  @GetMapping("getReviews")
  @ResponseBody
  public Object getReviews() throws Exception {
    return mainPageService.getReviews();
  }
  
}
