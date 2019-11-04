<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 상세 정보</title>
</head>
<body>

<div class="container">

    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
      <li class="breadcrumb-item active">
       <%--  <div class="title">
      <c:if test="${memberTypeNo == 1}">
        <h2 style="display:inline">학생 상세 정보</h2>
      </c:if>
      <c:if test="${memberTypeNo == 3}">
        <h2 style="display:inline">선생님 상세 정보</h2>
      </c:if>
    </div> --%>
      </li>
    </ol>
    
    <c:forEach items="${detailTeacher}" var="member">
    
    
    
    
  <div class="tch-profile">
    <img src="/WEB-INF/images/AP2/jpg" height="70px" /> 
    ${member.name}<br>
    ${member.gender}, ${member.dateOfBirth} 세<br> 
    <i class="fas fa-check"> </i>자격검증완료 
    <i class="far fa-envelope"></i> 
    <a href="http://naver.com"> 선생님께 쪽지 보내기 </a>
  </div><hr>
    </c:forEach>
</div>
<!-- Container / End -->

  <%-- <div class="information">
    <div class="info">
      <h3>기본정보</h3>
             학교: 한국대학교<br> 
             전공: 수학과<br> 
             지역: ${member.addressCity} ${member.addressSuburb}<br>
             가입일: ${member.registeredDate}<br>
             ${member.student.schoolType}
             ${member.student.parents }
    </div>

    <div class="tch-school-info">
        <h3>출신학교</h3>
        <p>한국 중학교 졸업</p>
        <p>한국 고등학교 졸업</p>
        <p>한국 대학교 수학과 재학중</p>
    </div>

    <div class="tch-introduce">
      <h3>자기소개</h3>
       ${member.teacher.teacherIntro}<br>
    </div>

    <div class="tch-introduce-video">
      <h3>자기소개영상</h3>
      ${member.teacher.videoAddress}
    </div> --%>

    <div class="tch-photos">
      <h3>사진</h3>
      <img src="images/hong.png" height="100px" /> 
      <img src="images/Rabbit.png" height="100px" /> 
      <img src="images/small.jpg" height="100px" />
    </div>
  </div><hr>

  <div class="tch-lesson">
    <div class="tch-lesson-subject">
      <p>과목: 초등 영어</p>
      <h3>과외 가능 요일/시간</h3>
      <p>월~금. 오후 7시 ~ 10시</p>
    </div>
    <div class="tch-lesson-fee">
      <h3>희망 과외 금액</h3>
      <p>30 ~ 40만원</p>
    </div>
  </div><hr>

  <div class="stu-lesson">
    <div class="stu-lesson-subject">
      <p>과목: 초등 수학</p>
      <h3>과외 가능 요일/시간</h3>
      <p>월~금. 오후 5시 ~ 7시</p>
    </div>
    <div class="stu-lesson-fee">
      <h3>희망 과외 금액</h3>
      <p>30 ~ 40만원</p>
    </div>
    <div class="stu-wanttotch">
      <h3>선생님께 바라는점</h3>
      <p>기초부터 탄탄하게 배우고 싶어요!</p>
    </div>
  </div><hr>

      <h3>선생님 과외 후기</h3>
    <div class="review">
      <img src="images/hong.png" height="70px" />
            학생1<br>
            과외과목: 초등수학<br>
            과외기간: 2018.5 ~ 2019.5<br>
            선생님이 수업에 열정적입니다. 성적이 많이 올랐어요 ~~<br>
    </div>

  <div class="page-button">
    <button>&lt;</button>
    <button>1</button>
    <button>&gt;</button>
  </div>




</body>
</html>