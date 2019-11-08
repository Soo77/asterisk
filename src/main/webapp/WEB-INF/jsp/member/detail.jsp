<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<style>

.card-body {
  float: left;
}

.btn.btn-link, .btn.btn-default.btn-link {
  background-color: transparent;
  color: #9c27b0;
  box-shadow: none;
}
</style>

<body class="profile-page sidebar-collapse">
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('../assets/img/city-profile.jpg');"></div>
  <div class="main main-raised">
    <div class="profile-content">
      <div class="container">
        <c:forEach items="${detailTeacher1}" var="member">
          <div class="row">
            <div class="col-md-6 ml-auto mr-auto">
              <div class="profile">
                <div class="avatar">
                  <img src="${member.teacherPhoto}" alt="Circle Image" class="img-raised rounded-circle img-fluid"
                    onError="this.src='/landing_images/images/default.jpg'">
                </div>
                <div class="name">
                  <h2 class="title">${member.name}</h2>
                  <h5>${member.gender},${member.dateOfBirth}</h5>
                  <h5><i class="fas fa-check-circle"></i> 인증 완료</h5>
                  <a href="#pablo" class="btn btn-just-icon btn-link btn-message">
                    <i class="far fa-comment-dots"></i></a> 
                  <a href="http://www.naver.com" class="btn btn-just-icon btn-link btn-photo">
                    <i class="far fa-image"></i></a> 
                  <a href="http://www.youtube.com" class="btn btn-just-icon btn-link btn-video">
                    <i class="fab fa-youtube"></i></a>
                </div>
              </div>
             <hr>
            </div>
          </div>

          <div class="description text-left">
            <div class="information">
              <div class="information title">
                <h3>기본정보</h3>
              </div>
              <div class="information contents">
                <ul>
                  <li>학교: ${member.schools[0].schoolName}</li>
                  <li>전공: ${member.schools[0].major}</li> 
                  <li>지역: ${member.addressCity} ${member.addressSuburb}</li>
                  <li>가입일: ${member.registeredDate}</li>
                </ul>
              </div>
            </div>

          <div class="tch-school">
            <div class="tch-school title">
              <h3>출신학교</h3>
            </div>
            <div class="tch-school contents">
              ${member.schools[0].schoolName}
            </div>
          </div>

          <div class="lesson-subject">
            <div class="lesson-subject title">
              <h3>과목</h3>
            </div>
            <div class="lesson-subject contents">
                               과목: ${member.schoolType} ${member.subjects[0].subjectName}
            </div>
          </div> 

          <div class="lesson-time">
            <div class="lesson-time title">
              <h3>과외 가능 요일/시간</h3>
            </div>
            <div class="lesson-time contents">
              ${member.curriculums[0].curriculumLessonDay}
              ${member.curriculums[0].curriculumLessonStartTime} ~
              ${member.curriculums[0].curriculumLessonEndTime}
            </div>
          </div>
          
          <div class="lesson-fee">
            <div class="lesson-fee title">
              <h3>희망 과외 금액</h3>
            </div>
            <div class="lesson-fee contents">
              ${member.lessonSubjects[0].wantedFee} 원
            </div>
          </div>

          <div class="tch-intro">
            <div class="tch-intro title">
              <h3>자기소개</h3>
            </div>
            <div class="tch-intro contents">
              ${member.teachers[0].teacherIntro}
            </div>
            <div class="tch-intro photo">
              <div class="tab-pane active text-center gallery" id="studio">
                <div class="row">
                  <div class="col-md-3 ml-auto">
                    <img src="/landing_images/images/hong.png"
                      class="rounded"> <img
                      src="/landing_images/images/hong.png"
                      class="rounded">
                  </div>
                  <div class="col-md-3 mr-auto">
                    <img src="/landing_images/images/hong.png"
                      class="rounded"> <img
                      src="/landing_images/images/hong.png"
                      class="rounded">
                  </div>
                </div>
              </div>
            </div>
            <div class="tch-intro video">
              <div class="iframe-container">
                <iframe class="embed-responsive-item" height="300" width="500"
                  src="https://www.youtube.com/embed/l502xg11uNM" 
                  frameborder="0" allowfullscreen></iframe>
                <%--  ${member.teachers[0].videoAddress} --%>
              </div>
            </div>
          </div>
          <hr>


          <div class="teacher-review">
            <div class="teacher-review title">
              <h3>선생님 과외 후기</h3>
            </div>
            <div class="teacher-review contents">
             <div class="card">
              <div class="card-header card-header-text card-header-primary">
                <div class="card-text">
                  <h4 class="card-title">학생 1</h4>
                </div>
              </div>
              <div class="card-body">
                                    과외과목: ${member.schoolType} ${member.subjects[0].subjectName}<br> 
                                    과외기간: 2018.5 ~ 2019.5<br> 
                                    후기: ${member.lessons[0].teacherReview}<br>
              </div>
             </div>
            </div>
           </div>
          </div>
          <!-- description text-center end -->
        </c:forEach>
      </div>
      <!-- Container / End -->
    </div>
  </div>

  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="../assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="../assets/js/core/bootstrap-material-design.min.js"
    type="text/javascript"></script>
  <script src="../assets/js/plugins/moment.min.js"></script>
  <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
  <script src="../assets/js/plugins/bootstrap-datetimepicker.js"
    type="text/javascript"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="../assets/js/plugins/nouislider.min.js"
    type="text/javascript"></script>
  <!--  Google Maps Plugin    -->
  <script
    src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/material-kit.js?v=2.0.6"
    type="text/javascript"></script>
</body>

</html>
