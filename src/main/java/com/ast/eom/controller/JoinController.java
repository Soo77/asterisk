package com.ast.eom.controller;

import java.io.File;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.ast.eom.domain.Member;
import com.ast.eom.domain.Parents;
import com.ast.eom.domain.WantedLesson;
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
    uploadDir = sc.getRealPath("/upload/join");
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
      Date birthDay, String mail, 
      String accountno, String bankname, String teacherintro, 
      MultipartFile lessoncertificate,
      String[] lessonDay,
      String highSchoolName, String universityName, String major,
      String subjectNo, String wantedFeeAmount)
          throws Exception {
    
    if(member.getTel().equals("")) {
      member.setTel(null);
    }
    
    if (lessonDay != null) {
      StringBuilder sb = new StringBuilder();
      sb.append("0000000");
      for(int i = 0; i < lessonDay.length; i++) {
        sb.setCharAt(Integer.parseInt(lessonDay[i]), '1'); 
      }
      member.setLessonDays(sb.toString());
    }

    String emailAddress = member.getEmail() + "@" + mail;
    member.setEmail(emailAddress);
    member.setDateOfBirth(birthDay);
    member.setMemberTypeNo(3);

    Map<String, Object> params = new HashMap<>();
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
    
    joinService.insertForStudentAndTeacher(member);
    
    params.put("teacherNo", member.getMemberNo());
    params.put("accountNo", accountno);
    params.put("bankName", bankname);
    params.put("teacherIntro", teacherintro);
    
    joinService.teacherInsert(params);
    Map<String, Object> schoolParams = new HashMap<>();
    schoolParams.put("teacherNo", member.getMemberNo());
    schoolParams.put("highSchool", highSchoolName);
    schoolParams.put("university", universityName);
    schoolParams.put("major", major);
    
    joinService.teacherSchoolsInsert(schoolParams);
    
    int wantedFeeAmountInt = Integer.parseInt(wantedFeeAmount);
    if (wantedFeeAmountInt >= 40) {
      wantedFeeAmountInt = 4;
      
    } else if (wantedFeeAmountInt >= 30) {
      wantedFeeAmountInt = 3;
      
    } else if (wantedFeeAmountInt >= 20) {
      wantedFeeAmountInt = 2;
      
    } else {
      wantedFeeAmountInt = 1;
    }

    Map<String, Object> subjectParams = new HashMap<>();
    subjectParams.put("teacherNo", member.getMemberNo());
    subjectParams.put("subjectNo", subjectNo);
    subjectParams.put("wantedFee", wantedFeeAmountInt);
    
    joinService.teacherSubjectInsert(subjectParams);

    this.emailAddress = emailAddress;
    executorService = Executors.newCachedThreadPool();
    executorService.submit(this);

    return "redirect:/app/auth/form";
  }

  //학부모 회원가입
  @PostMapping("parentsjoin")
  public String parentsjoin(Member member, 
      MultipartFile filePath,
      Date birthDay, String mail,
      String studentId) 
          throws Exception {
    
    if(member.getTel().equals("")) {
      member.setTel(null);
    }
    
    String emailAddress = member.getEmail() + "@" + mail;
    member.setEmail(emailAddress);
    member.setDateOfBirth(birthDay);
    member.setMemberTypeNo(2);

    if (!filePath.isEmpty()) {
      String filename = UUID.randomUUID().toString();
      filePath.transferTo(new File(uploadDir + "/" + filename));
      member.setProfilePhoto(filename);
    }

    String key = new TempKey().getKey(50, false);
    this.key = key;
    member.setActivationKey(key);

    joinService.insert(member);
    Parents joinedParents = new Parents();
    joinedParents.setParentsNo(member.getMemberNo());
    joinService.parentsInsert(joinedParents);
    Map<String, Object> parentsMap = new HashMap<>();
    parentsMap.put("parentsNo", joinedParents.getParentsNo());
    parentsMap.put("studentId", studentId);
    joinService.bindStudentAndParents(parentsMap);

    this.emailAddress = emailAddress;
    executorService = Executors.newCachedThreadPool();
    executorService.submit(this);
    
    return "redirect:/app/auth/form";
  }

  //학생 회원가입
  @PostMapping("studentjoin")
  public String studentjoin(Member member, 
      MultipartFile filePath,
      Date birthDay, String mail,
      String[] lessonDay, String requirementsToTeacher,
      WantedLesson wantedLesson) 
          throws Exception {
    
    if(member.getTel().equals("")) {
      member.setTel(null);
    }
    
    if (lessonDay != null) {
      StringBuilder sb = new StringBuilder();
      sb.append("0000000");
      for(int i = 0; i < lessonDay.length; i++) {
        sb.setCharAt(Integer.parseInt(lessonDay[i]), '1'); 
      }
      member.setLessonDays(sb.toString());
    }

    String emailAddress = member.getEmail() + "@" + mail;
    member.setEmail(emailAddress);
    member.setDateOfBirth(birthDay);
    member.setMemberTypeNo(1);

    if (!filePath.isEmpty()) {
      String filename = UUID.randomUUID().toString();
      filePath.transferTo(new File(uploadDir + "/" + filename));
      member.setProfilePhoto(filename);
    }

    String key = new TempKey().getKey(50, false);
    this.key = key;
    member.setActivationKey(key);
    
    joinService.insertForStudentAndTeacher(member);

    Map<String, Object> params = new HashMap<>();
    params.put("studentNo",member.getMemberNo());
    params.put("requirementsToTeacher",requirementsToTeacher);
    joinService.studentInsert(params);
    
    wantedLesson.setStudentNo(member.getMemberNo());
    joinService.wantedLessonFotStudentInsert(wantedLesson);

    this.emailAddress = emailAddress;
    executorService = Executors.newCachedThreadPool();
    executorService.submit(this);

    return "redirect:/app/auth/form";
  }

  @Override
  public void run() {
    System.out.println(emailAddress);

    String host = "smtp.naver.com"; 
    // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
    String user = "bitcampshin@naver.com"; 
    // 패스워드
    String password = "Bitcamp1111~";      

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
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailAddress)); 

      // 메일 제목 
      message.setSubject("엄과외 회원가입 인증메일입니다"); 

      String htmlStr = "<h2>안녕하세요 엄과외입니다!</h2><br><br>" 
          + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
          + "<a href='http://14.52.43.55:8888/app/join/emailConfirm?key="+key+"'>인증하기</a></p>"
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
  public String emailConfirm(Model model, String key) throws Exception {
    boolean checkKey = joinService.checkOverKey(key);
    model.addAttribute("checkKey", checkKey);
    if(checkKey == false) {
      joinService.updateCheck(key);
      return "/view/welcome";
    }
    return "/view/welcome";
  }

  @GetMapping("idCheck")
  @ResponseBody
  public int idCheck(String id) throws Exception {
    return joinService.checkOverId(id);
  }
  
  @GetMapping("childCheck")
  @ResponseBody
  public List<Member> childCheck(String id) throws Exception {
    return joinService.checkOverChildId(id);
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

}