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
   <c:if test="${memberTypeNo == 1}">
          <h2 style="display: inline">학생 상세정보</h2>
        </c:if> 
        <c:if test="${memberTypeNo == 3}">
          <h2 style="display: inline">선생님 상세정보</h2>
        </c:if> 



    <c:forEach items="${detailTeacher1}" var="member">
      <div class="tch-profile">
        <div class="card-body">
          <div class="cardcard mb-3">
            <div class="row no-gutters">
              <div class="col-md-3">
                <img src="/landing_images/images/AP2.jpg"
                  class="card-img">
              </div>
              <div class="col-md-9">
                <h5 class="card-title">${member.name}</h5>
                <p class="card-text">
                <ul>
                  <li>${member.gender}</li> 
                  <li>${member.dateOfBirth}</li> 
                  <li><i class="far fa-check-circle"></i>자격검증완료 </li>
                  <li><a href="http://naver.com"><i class="far fa-envelope"></i>선생님께 쪽지 보내기</a></li> 
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <hr>

      <div class="info">
        <h3>기본정보</h3>
        <ul>
           <li><i class="fas fa-graduation-cap"></i> 학교: ${member.schools[0].schoolName}</li> 
           <li>전공: ${member.schools[0].major}</li> 
           <li>지역: ${member.addressCity} ${member.addressSuburb}</li> 
           <li>가입일: ${member.registeredDate}</li>
        </ul>
      </div>
      <hr>
      
      <div class="tch-school-info">
        <h3>출신학교</h3>
        <ul>
          <li> ${member.schools[0].schoolName}</li>
          <li> ${member.schools[0].schoolName}</li>
        </ul>
    </div>
    
    <div class="tch-intro">
      <h3>자기소개</h3>
       <ul>
          <li>${member.teachers[0].teacherIntro}</li>
    </div> 
    
    <div class="tch-introduce-video">
      <h3>자기소개영상</h3>
      <ul>
       <li>${member.teachers[0].videoAddress}</li>
    </div>
      
    <div class="tch-photos">
      <h3>사진</h3>
      <img src="/landing_images/images/hong.png" height="100px" /> 
      <img src="/landing_images/images/Rabbit.png" height="100px" /> 
      <img src="/landing_images/images/small.jpg" height="100px" />
    </div>
    <hr>
    
     <div class="tch-lesson">
    <h3>과목</h3>
      <ul>
        <li>과목: ${member.schoolType} ${member.subjects[0].subjectName}</li>
      </ul>
    <h3>과외 가능 요일/시간</h3>
      <ul>
        <li>월~금. 오후 7시 ~ 10시</li>
      </ul>
    <h3>희망 과외 금액</h3>
      <ul>
        <li>${member.lessonSubjects[0].wantedFee}만원</li>
      </ul>
  </div>
  <hr>
      
    </c:forEach>
  </div>
  <!-- Container / End -->



  <h3>선생님 과외 후기</h3>
  <div class="review">
    <img src="/landing_images/images/hong.png" height="70px" /> 학생1<br>
    과외과목: 초등수학<br> 과외기간: 2018.5 ~ 2019.5<br> 선생님이 수업에 열정적입니다.
    성적이 많이 올랐어요 ~~<br>
  </div>

  <div class="page-button">
    <button>&lt;</button>
    <button>1</button>
    <button>&gt;</button>
  </div>




</body>
</html>