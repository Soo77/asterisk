<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<style>
img, video {
  display: inline-block;
  width: auto\9 !important; /* ie8 */
  width: auto !important;
  max-width: 100%;
  height: auto !important;
}

.video-container {
  position: relative;
  height: 0;
  padding-top: 30px;
  padding-bottom: 56.25%;
  overflow: hidden;
}

.video-container iframe, .video-container object, .video-container embed
  {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.card-body {
  float: left;
}

.btn.btn-link, .btn.btn-default.btn-link {
  background-color: transparent;
  color: #9c27b0;
  box-shadow: none;
}

 ul.maininfo, ul.subinfo {
  list-style: none;
  padding-left: 15px;
}

*.icon-purple {
  color: #9c27b0
}

ul li i {
    vertical-align: middle;
}


 

</style>

<body class="profile-page sidebar-collapse">
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('');"></div>
  <div class="main main-raised">
    <div class="profile-content">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="profile">

              <!-- 선생님 프로필 top -->
              <c:forEach items="${detailTeacher}" var="member">
                <c:if test="${member.memberTypeNo eq 3}">

                  <div class="avatar">
                    <img src="/upload/join/${member.profilePhoto}"
                      alt="Circle Image"
                      class="img-raised rounded-circle img-fluid"
                      onError="this.src='/upload/join/default.png'">
                  </div>

                  <div class="name">
                    <h3 class="title">${member.name}</h3>

                    <div class="age">
                      <c:set var="birth" value="${member.dateOfBirth}" />
                      <!-- 현재년도 가져오기 -->
                      <c:set var="now" value="<%=new java.util.Date()%>" />
                      <c:set var="sysYear">
                        <fmt:formatDate value="${now}" pattern="yyyy" />
                      </c:set>
                      <c:set var="year"
                        value="${fn:substring(sysYear,0,4)}" />
                      <c:set var="birthyear"
                        value="${fn:substring(birth,0,4)}" />
                      <c:set var="age" value="${year-birthyear+1}" />
                    </div>

                    <div class="age_gender">
                      <h5>${member.gender},${age} 세</h5>
                    </div>

                    <div class="confirmed">
                      <h5>
                        <i class="fas fa-check-circle"></i> 인증 완료
                      </h5>
                    </div>

                    <div class="menu button">
                      <a href="#pablo"  class="btn btn-just-icon btn-link btn-message">
                        <i class="far fa-comment-dots"></i></a> 
                      <a href="http://www.naver.com" class="btn btn-just-icon btn-link btn-photo">
                        <i class="far fa-image"></i></a> 
                      <a href="http://www.youtube.com" class="btn btn-just-icon btn-link btn-video">
                        <i class="fab fa-youtube"></i></a>
                    </div>

                  </div>
                </c:if>
              </c:forEach>

              <!-- 학생 프로필 top -->
              <c:forEach items="${detailStudent}" var="member">
                <c:if test="${member.memberTypeNo eq 1}">

                  <div class="avatar">
                    <img src="/upload/join/${member.profilePhoto}"
                      alt="Circle Image"
                      class="img-raised rounded-circle img-fluid"
                      onError="this.src='/upload/join/default.png'">
                  </div>

                  <div class="name">
                    <h3 class="title">${member.name}</h3>

                    <div class="age">
                      <c:set var="birth" value="${member.dateOfBirth}" />
                      <!-- 현재년도 가져오기 -->
                      <c:set var="now" value="<%=new java.util.Date()%>" />
                      <c:set var="sysYear">
                        <fmt:formatDate value="${now}" pattern="yyyy" />
                      </c:set>
                      <c:set var="year" value="${fn:substring(sysYear,0,4)}" />
                      <c:set var="birthyear" value="${fn:substring(birth,0,4)}" />
                      <c:set var="age" value="${year-birthyear+1}" />
                    </div>

                    <div class="age_gender">
                      <h5>${member.gender},${age} 세</h5>
                    </div>

                    <a href="#pablo"
                      class="btn btn-just-icon btn-link btn-message">
                      <i class="far fa-comment-dots"></i>
                    </a>

                  </div>
                </c:if>
              </c:forEach>

            </div>
            <!-- profile end -->
            <hr>
          </div>
        </div>
        <!-- row end -->

        <div class="description text-left">

          <!-- 선생님 프로필 bottom -->
          <c:forEach items="${detailTeacher}" var="member">
            <c:if test="${member.memberTypeNo eq 3}">


              <div class="information">
                <div class="row">
                  <div class="col-lg-6 col-sm-6">
                    <label class="information main">기본 정보</label>
                    <div class="main-info-body">
                      <ul class="maininfo">
                        <li class="school"><i class="material-icons">school</i> 학교: ${member.schools[0].schoolName}</li>
                        <li class="major"><i class="material-icons">work</i> 전공: ${member.schools[0].major}</li>
                        <li class="address"><i class="material-icons">where_to_vote</i> 지역: ${member.addressCity} ${member.addressSuburb}</li>
                        <li class="registeredDate"><i class="material-icons">person</i> 가입일: ${member.registeredDate}</li>
                      </ul>
                    </div>
                  </div>

                  <div class="col-lg-6 col-sm-6">
                    <label class="information sub">추가 정보</label><br>
                    <div class="sub-info-body">
                      <ul class="subinfo">
                        <li class="preschool"><i class="material-icons">school</i> 출신 학교: ${member.schools[0].schoolName}</li>
                        <li class="subject"><i class="material-icons">menu_book</i> 과목: ${member.schoolType} ${member.subjectName}</li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!-- row end -->
                
              </div>
              <hr>


              <div class="lesson-time">
                <label class="lesson-time-title">과외 가능 요일/시간</label>
                <div class="lesson-time contents">
                  <ul>
                    <li>
                      <div class="lesson-time days">
                        <c:set var="week" value="${member.lessonDays}" />
                        <c:set var="sun"
                          value="${fn:substring(week,0,1)}" />
                        <c:set var="mon"
                          value="${fn:substring(week,1,2)}" />
                        <c:set var="tue"
                          value="${fn:substring(week,2,3)}" />
                        <c:set var="wed"
                          value="${fn:substring(week,3,4)}" />
                        <c:set var="thu"
                          value="${fn:substring(week,4,5)}" />
                        <c:set var="fri"
                          value="${fn:substring(week,5,6)}" />
                        <c:set var="sat"
                          value="${fn:substring(week,6,7)}" />
                        <c:if test="${sun == '1'}">일요일</c:if>
                        <c:if test="${mon == '1'}">월요일</c:if>
                        <c:if test="${tue == '1'}">화요일</c:if>
                        <c:if test="${wed == '1'}">수요일</c:if>
                        <c:if test="${thu == '1'}">목요일</c:if>
                        <c:if test="${fri == '1'}">금요일</c:if>
                        <c:if test="${sat == '1'}">토요일</c:if>
                      </div>
                    </li>

                    <li>
                      <div class="lesson-time times">
                        ${member.lessonStartTime} ~${member.lessonEndTime}
                      </div>
                    </li>
                  </ul>
                </div>
              </div>


              <div class="lesson-fee">
                <label class="lesson-fee title">희망 과외 금액</label>
                <div class="lesson-fee contents">
                  <ul>
                    <c:if  test="${member.lessonSubjects[0].wantedFee == 1}">
                      <li>20만원 이하</li>
                    </c:if>
                    <c:if test="${member.lessonSubjects[0].wantedFee == 2}">
                      <li>20만원~30만원</li>
                    </c:if>
                    <c:if test="${member.lessonSubjects[0].wantedFee == 3}">
                      <li>30만원~40만원</li>
                    </c:if>
                    <c:if test="${member.lessonSubjects[0].wantedFee == 4}">
                      <li>40만원 이상</li>
                    </c:if>
                  </ul>
                </div>
              </div>
              <hr>


              <div class="tch-intro">
                <label class="tch-intro title">자기소개</label>
                <div class="tch-intro contents">
                  ${member.teachers[0].teacherIntro}<br>
                </div>
              </div>
              <hr>


              <div class="media">
                <label class="media title">미디어</label>
              </div>

              <div class="card-deck">
                <div class="card">
                  <img src="/upload/join/${member.teacherPhoto}" class="card-img-top">
                </div>
                <div class="card">
                  <img src="/upload/join/${member.teacherPhoto}" class="card-img-top">
                </div>
              </div>
              <br>
              <br>
              <br>

              <div class="video-container">
                <iframe width="640" height="480" src="https://www.youtube.com/embed/5w0SKw5oBPg" 
                frameborder="0" allowfullscreen> </iframe>
              </div>
              <hr>

              <div class="teacher-review">
                <label class="teacher-review title">선생님 후기</label>
                <div class="teacher-review contents">
                  <div class="card">
                    <div class="card-header card-header-text card-header-primary">
                      <div class="card-text">
                        <h5 class="card-title">학생 1</h5>
                      </div>
                    </div>
                    <div class="card-body">
                                                과외과목: ${member.schoolType} ${member.subjectName}<br>
                                                과외기간: 2018.5 ~ 2019.5<br> 
                                                후기: ${member.lessons[0].teacherReview}<br>
                    </div>
                  </div>
                </div>
              </div>
              <br>
              <br>

            </c:if>
          </c:forEach>
          <!-- 선생님 프로필 bottom end-->

          <!-- 학생 프로필 bottom -->
          <c:forEach items="${detailStudent}" var="member">
            <c:if test="${member.memberTypeNo eq 1}">


              <div class="information">
                <div class="row">
                  <div class="col-lg-6 col-sm-6">
                    <label class="information main">기본 정보</label>
                    <div class="main-info-body">
                      <ul>
                        <li class="school">학교: ${member.schoolType} ${member.memberTypeName}</li>
                        <li class="address">지역: ${member.addressCity} ${member.addressSuburb}</li>
                        <li class="registeredDate">가입일: ${member.registeredDate}</li>
                      </ul>
                    </div>
                  </div>

                  <div class="col-lg-6 col-sm-6">
                    <label class="information sub">추가 정보</label><br>
                    <div class="sub-info-body">
                      <ul>
                        <li class="subject">과목:
                          ${member.schoolType} ${member.subjectName}</li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!-- row end -->
              </div>
              <hr>


              <div class="lesson-time">
                <label class="lesson-time-title">과외 가능 요일/시간</label>
                <div class="lesson-time contents">
                  <ul>
                    <li>
                      <div class="lesson-time days">
                        <c:set var="week" value="${member.lessonDays}" />
                        <c:set var="sun"
                          value="${fn:substring(week,0,1)}" />
                        <c:set var="mon"
                          value="${fn:substring(week,1,2)}" />
                        <c:set var="tue"
                          value="${fn:substring(week,2,3)}" />
                        <c:set var="wed"
                          value="${fn:substring(week,3,4)}" />
                        <c:set var="thu"
                          value="${fn:substring(week,4,5)}" />
                        <c:set var="fri"
                          value="${fn:substring(week,5,6)}" />
                        <c:set var="sat"
                          value="${fn:substring(week,6,7)}" />
                        <c:if test="${sun == '1'}">일요일</c:if>
                        <c:if test="${mon == '1'}">월요일</c:if>
                        <c:if test="${tue == '1'}">화요일</c:if>
                        <c:if test="${wed == '1'}">수요일</c:if>
                        <c:if test="${thu == '1'}">목요일</c:if>
                        <c:if test="${fri == '1'}">금요일</c:if>
                        <c:if test="${sat == '1'}">토요일</c:if>
                      </div>
                    </li>

                    <li>
                      <div class="lesson-time times">
                        ${member.lessonStartTime} ~ ${member.lessonEndTime}
                      </div>
                    </li>
                  </ul>
                </div>
              </div>


              <div class="lesson-fee">
                <label class="lesson-fee title">희망 과외 금액</label>
                <div class="lesson-fee contents">
                  <ul>
                    <c:if test="${member.students[0].wantedFee == 1}">
                      <li>20만원 이하</li>
                    </c:if>
                    <c:if test="${member.students[0].wantedFee == 2}">
                      <li>20만원~30만원</li>
                    </c:if>
                    <c:if test="${member.students[0].wantedFee == 3}">
                      <li>30만원~40만원</li>
                    </c:if>
                    <c:if test="${member.students[0].wantedFee == 4}">
                      <li>40만원 이상</li>
                    </c:if>
                  </ul>
                </div>
              </div>
              <hr>

              <div class="stu_wanted">
                <label class="stu_wanted title">선생님께 바라는 점</label>
                <div class="stu_wanted contents">
                  ${member.students[0].requirementsToTeacher}<br>
                </div>
              </div>
              <hr>



              <div class="student-review">
                <label class="student-review title">학생 후기</label>
                <div class="student-review contents">
                  <div class="card">
                    <div
                      class="card-header card-header-text card-header-primary">
                      <div class="card-text">
                        <h4 class="card-title">선생님1</h4>
                      </div>
                    </div>
                    <div class="card-body">
                                              과외과목: ${member.schoolType} ${member.subjectName}<br>
                                              과외기간: 2018.5 ~ 2019.5<br> 
                                              후기: ${member.lessons[0].studentReview}<br>
                    </div>
                  </div>
                </div>
              </div>
              <br>
              <br>


            </c:if>
          </c:forEach>

        </div>
        <!-- description text-center end -->
      </div>
      <!-- Container / End -->
    </div>
  </div>

</body>
</html>
