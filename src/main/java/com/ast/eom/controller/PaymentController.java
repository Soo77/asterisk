package com.ast.eom.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ast.eom.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
  
  @Autowired
  PaymentService paymentService;
  
  @GetMapping("detail")
  public void detail(Model model) throws Exception {
    model.addAttribute("teacherInfoMap",
        paymentService.prepareTeacherInfoMapWith());
  }
  
  @GetMapping("success")
  public void success(HttpServletResponse response) throws Exception {
    paymentService.updatePaymentInfo();
    response.sendRedirect("/app/lesson/list");
  }
  
}
