package com.ast.eom.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ast.eom.domain.Member;
import com.ast.eom.service.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController implements Runnable {

  String whatmail;
  ExecutorService executorService;

  @Autowired
  private AuthService authService;

  @GetMapping("form")
  public void form() {
  }
  
  @GetMapping("loginFail")
  public void loginFail() {
  }
  
  @GetMapping("loginFailRedirect")
  public void loginFailRedirect(HttpServletResponse response)
      throws Exception {
    response.sendRedirect("/app/auth/form");
  }

  @PostMapping("loginId")
  @ResponseBody
  public int loginid(String id) 
      throws Exception {
    return authService.loginId(id);
  }
  
  @PostMapping("login")
  @ResponseBody
  public Member login(HttpSession session, String id, String pw) 
      throws Exception {
	  Map<String, String> params = new HashMap<>();
	  params.put("id", id);
	  params.put("pw", pw);
	
	  Member member = authService.login(params);
	  session.setAttribute("loginUser", member);
    
	  return member;
  }

  @GetMapping("logout")
  public String logout(HttpSession session) 
      throws Exception {
    session.invalidate();
    return "redirect:/";
  }

  // 아이디 찾기
  @PostMapping("searchId")
  @ResponseBody
  public String searchId(String mail0, String mail1,
      String name) throws Exception {
    String email = mail0+"@"+mail1;

    Member member = new Member();
    member.setEmail(email);
    member.setName(name);

    return authService.findId(member);
  }

  // 비밀번호 찾기 일치
  @PostMapping("findpw2")
  @ResponseBody
  private int findpw2(String name, String id, String whatmail) 
      throws Exception {
    Member member = new Member();
    member.setId(id);
    member.setName(name);
    member.setEmail(whatmail);
    
    return authService.findPw(member);
  }
  
  // 아이디 찾기페이지
  @GetMapping("findid")
  public void findid() throws Exception {
  }

  // 비밀번호 찾기페이지
  @GetMapping("findpw")
  public void findpw() throws Exception {
  }

  // 메일 전송
  @PostMapping("mailsend")
  @ResponseBody
  public void mailsend(String whatmail) throws Exception {
    this.whatmail = whatmail;
    executorService = Executors.newCachedThreadPool();
    executorService.submit(this);
  }

  @Override
  public void run() {
    System.out.println(whatmail);

    String host = "smtp.fastmail.com"; 
    // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
    String user = "bitcamppr@fastmail.com"; 
    // 패스워드
    String password = "ENCRJ3GAJV56WZG9";      

    // SMTP 서버 정보를 설정한다. 
    Properties props = new Properties(); 
    props.put("mail.smtp.host", host); 
    props.put("mail.smtp.port", 465); 
    props.put("mail.smtp.auth", "true"); 
    props.put("mail.smtp.ssl.enable", "true"); 
    props.put("mail.smtp.ssl.trust", host);

    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
      protected PasswordAuthentication getPasswordAuthentication() { 
        return new PasswordAuthentication(user, password); 
      } 
    });

    // 인증 번호 난수
    Random rand = new Random();
    String sb = new String();
    for (int i = 0; i < 5; i++) {
      int index = rand.nextInt(2);
      switch(index) {
        case 0:
          sb += ((char)(rand.nextInt(26)+97));
          break;
        case 1:
          sb += (rand.nextInt(10));
          break;
      }
    }

    try { 
      MimeMessage message = new MimeMessage(session);
      message.setFrom(new InternetAddress(user));
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(whatmail)); 
      // 메일 제목 
      message.setSubject("엄과외 비밀번호 초기화됐습니다."); 
      // 메일 내용 
      message.setText("초기화된 비밀번호는 "+sb+"입니다."); 

      // send the message 
      Transport.send(message); 

      Member member = new Member();
      member.setEmail(whatmail);
      member.setPassword(sb);

      authService.pwChange(member);
    } catch (Exception e) { 
      e.printStackTrace(); 
    }
  }

}
