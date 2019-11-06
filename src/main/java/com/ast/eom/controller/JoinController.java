package com.ast.eom.controller;

import java.io.File;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.ast.eom.domain.Member;
import com.ast.eom.service.JoinService;

@Controller
@RequestMapping("/join")
public class JoinController implements Runnable {
  String emailAddress;
  String key;
  ExecutorService executorService;

  @Autowired
  JoinService joinService;

  String uploadDir;

  public JoinController(ServletContext sc) {
    uploadDir = sc.getRealPath("/upload");
  }

  @GetMapping("student")
  public void student() {
  }

  @GetMapping("parents")
  public void parents() {
  }

  @GetMapping("teacher")
  public void teacher() {
  }

  @GetMapping("form")
  public void form() {
  }
  
  @GetMapping("registration")
  public void registration() {}
  
  @GetMapping("memberselect")
  public void memberselect() {}
  
  // 선생님 회원가입
  @PostMapping("teacherjoin")
  public String teacherjoin(Member member, 
      MultipartFile filePath,
      int memberTypeNo,
      String birthyy, String birthmm, String birthdd, 
      String mail, 
      String accountno, String bankname, String teacherintro, 
      MultipartFile lessoncertificate) 
          throws Exception {

    String emailAddress = member.getEmail() + "@" + mail;
    String dob = birthyy + "-" + birthmm + "-" + birthdd;
    Date testdob = Date.valueOf(dob);
    member.setEmail(emailAddress);
    member.setDateOfBirth(testdob);
//    member.getMemberType().setMemberTypeNo(memberTypeNo);
    member.setMemberTypeNo(memberTypeNo);
    //멤버 타입 수정함 MemberType

    Map<String, Object> params = new HashMap<>();
    params.put("accountNo", accountno);
    params.put("bankName", bankname);
    params.put("teacherIntro", teacherintro);

    if (!lessoncertificate.isEmpty()) {
      String filename = UUID.randomUUID().toString();
      lessoncertificate.transferTo(new File(uploadDir + "/" + filename));
      params.put("lessonCertificate", filename);
    }

    if (!filePath.isEmpty()) {
      String filename = UUID.randomUUID().toString();
      filePath.transferTo(new File(uploadDir + "/" + filename));
      member.setProfilePhoto(filename);
    }

    String key = new TempKey().getKey(50, false);
    this.key = key;
    member.setActivationKey(key);

    joinService.teacherInsert(params);
    joinService.insert(member);

    this.emailAddress = emailAddress;
    executorService = Executors.newCachedThreadPool();
    executorService.submit(this);

    return "/view/checkplease";
  }

  //학부모 회원가입
  @PostMapping("parentsjoin")
  public String parentsjoin(Member member, 
      MultipartFile filePath,
      int memberTypeNo,
      String birthyy, String birthmm, String birthdd, 
      String mail) 
          throws Exception {

    String emailAddress = member.getEmail() + "@" + mail;
    String dob = birthyy + "-" + birthmm + "-" + birthdd;
    Date testdob = Date.valueOf(dob);
    member.setEmail(emailAddress);
    member.setDateOfBirth(testdob);
    //   member.getMemberType().setMemberTypeNo(memberTypeNo);
    member.setMemberTypeNo(memberTypeNo);
    //멤버 타입 수정함 MemberType

    Map<String, Object> params = new HashMap<>();

    if (!filePath.isEmpty()) {
      String filename = UUID.randomUUID().toString();
      filePath.transferTo(new File(uploadDir + "/" + filename));
      member.setProfilePhoto(filename);
    }

    String key = new TempKey().getKey(50, false);
    this.key = key;
    member.setActivationKey(key);

//    joinService.parentsInsert(params);
    joinService.insert(member);

    this.emailAddress = emailAddress;
    executorService = Executors.newCachedThreadPool();
    executorService.submit(this);

    return "/view/checkplease";
  }

  //학생 회원가입
  @PostMapping("studentjoin")
  public String studentjoin(Member member, 
      MultipartFile filePath,
      int memberTypeNo,
      String birthyy, String birthmm, String birthdd, 
      String mail) 
          throws Exception {

    String emailAddress = member.getEmail() + "@" + mail;
    String dob = birthyy + "-" + birthmm + "-" + birthdd;
    Date testdob = Date.valueOf(dob);
    member.setEmail(emailAddress);
    member.setDateOfBirth(testdob);
    //  member.getMemberType().setMemberTypeNo(memberTypeNo);
    member.setMemberTypeNo(memberTypeNo);
    //멤버 타입 수정함 MemberType

    Map<String, Object> params = new HashMap<>();

    if (!filePath.isEmpty()) {
      String filename = UUID.randomUUID().toString();
      filePath.transferTo(new File(uploadDir + "/" + filename));
      member.setProfilePhoto(filename);
    }

    String key = new TempKey().getKey(50, false);
    this.key = key;
    member.setActivationKey(key);

//    joinService.studentInsert(params);
    joinService.insert(member);

    this.emailAddress = emailAddress;
    executorService = Executors.newCachedThreadPool();
    executorService.submit(this);

    return "/view/checkplease";
  }

  @Override
  public void run() {
    System.out.println(emailAddress);

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

    try { 
      MimeMessage message = new MimeMessage(session);
      message.setFrom(new InternetAddress(user));
      message.addRecipient(Message.RecipientType.TO, new InternetAddress("s_swwhh@naver.com")); 

      // 메일 제목 
      message.setSubject("엄과외 회원가입 인증~"); 

      String htmlStr = "<h2>안녕하세요 엄과외입니다!</h2><br><br>" 
          + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
          + "<a href='http://localhost:4444/app/join/emailConfirm?key="+key+"'>인증하기</a></p>"
          + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";

      // 메일 내용 
      message.setText(htmlStr, "utf-8", "html"); 

      // send the message 
      Transport.send(message); 
    } catch (Exception e) { 
      e.printStackTrace(); 
    }
  }

  public class TempKey {

    private boolean lowerCheck;
    private int size;

    public String getKey(int size, boolean lowerCheck) {
      this.size = size;
      this.lowerCheck = lowerCheck;
      return init();
    }

    private String init() {
      System.out.println(size);
      Random ran = new Random();
      StringBuffer sb = new StringBuffer();
      int num = 0;
      do {
        num = ran.nextInt(75)+48;
        if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
          sb.append((char)num);
        }else {
          continue;
        }
      } while (sb.length() < 20);
      if(lowerCheck) {
        return sb.toString().toLowerCase();
      }
      return sb.toString();
    }
  }

  @GetMapping("emailConfirm")
  public String emailConfirm(String key) throws Exception {
    System.out.println(key);
    joinService.updateCheck(key);
    return "/view/welcome";
  }

  @GetMapping("idCheck")
  @ResponseBody
  public int idCheck(String id) throws Exception {
    return joinService.checkOverId(id);
  }

  @GetMapping("emailCheck")
  @ResponseBody
  public int emailCheck(String email) throws Exception {
    return joinService.checkOverEmail(email);
  }

  @GetMapping("telCheck")
  @ResponseBody
  public int telCheck(String tel) throws Exception {
    return joinService.checkOverTel(tel);
  }
  
  @GetMapping("acCheck")
  @ResponseBody
  public int acCheck(String accountno) throws Exception {
    return joinService.checkOverAccountNo(accountno);
  }

}