<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
 =========================================================
 * Material Kit - v2.0.6
 =========================================================

 * Product Page: https://www.creative-tim.com/product/material-kit
 * Copyright 2019 Creative Tim (http://www.creative-tim.com)
   Licensed under MIT (https://github.com/creativetimofficial/material-kit/blob/master/LICENSE.md)


 =========================================================

 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Material Kit by Creative Tim
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="/assets/css/material-kit.css?v=2.0.6" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="profile-page sidebar-collapse">
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('../assets/img/city-profile.jpg');"></div>
  <div class="main main-raised">
    <div class="profile-content">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="profile">
              <div class="avatar">
                <img src="/landing_images/images/hong.png" alt="Circle Image" class="img-raised rounded-circle img-fluid">
              </div>
    <c:forEach items="${detailTeacher1}" var="member">
              <div class="name">
                <h3 class="title">${member.name}</h3>
                <h6>${member.gender}, ${member.dateOfBirth}</h6>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-dribbble"><i class="fa fa-dribbble"></i></a>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-twitter"><i class="fa fa-twitter"></i></a>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-pinterest"><i class="fa fa-pinterest"></i></a>
              </div>
            </div>
          </div>
        </div>
        <div class="description text-center">
      <div class="info">
        <h3>기본정보</h3>
           학교: ${member.schools[0].schoolName}
           전공: ${member.schools[0].major} 
           지역: ${member.addressCity} ${member.addressSuburb}
           가입일: ${member.registeredDate}
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
      
  <h3>선생님 과외 후기</h3>
  <div class="review">
    <img src="/landing_images/images/hong.png" height="70px" /> 학생1<br>
    과외과목: 초등수학<br> 과외기간: 2018.5 ~ 2019.5<br> 선생님이 수업에 열정적입니다.
    성적이 많이 올랐어요 ~~<br>
  </div>
  
    </c:forEach>
  
        
        </div>
        
        <div class="tab-content tab-space">
          <div class="tab-pane active text-center gallery" id="studio">
            <div class="row">
              <div class="col-md-3 ml-auto">
                <img src="/landing_images/images/hong.png" class="rounded">
                <img src="/landing_images/images/hong.png" class="rounded">
              </div>
              <div class="col-md-3 mr-auto">
                <img src="/landing_images/images/hong.png" class="rounded">
                <img src="/landing_images/images/hong.png" class="rounded">
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Container / End -->
    </div>
  </div>
 
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="../assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="../assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
  <script src="../assets/js/plugins/moment.min.js"></script>
  <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
  <script src="../assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="../assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/material-kit.js?v=2.0.6" type="text/javascript"></script>
</body>

</html>
