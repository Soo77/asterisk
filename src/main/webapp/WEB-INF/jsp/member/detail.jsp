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

.card-img-top {
  width: 200px !important;
  height: 200px !important;
  object-fit: cover;
}

.img-raised.rounded-circle.img-fluid {
  width: 160px !important;
  height: 160px !important;
  object-fit: cover;
}

ul.test {
  list-style-type: square;
}

.fas.fa-star {
    font-size: large;
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
    display: inline-block;
    font-style: normal;
    font-variant: normal;
    text-rendering: auto;
    line-height: 1;
    color: yellow;
    font-size: x-large;
}



</style>

<body class="profile-page sidebar-collapse">
  <div class="page-header header-filter" data-parallax="true"
    style="background-image: url('/assets/img/bg/bg20.jpg');"></div>
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
                      class="img-raised rounded-circle img-fluid profile-photo"
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
                      <button onclick="messageShow(this)"
                        value="${member.memberNo}"
                        class="btn btn-just-icon btn-link btn-message">
                        <i class="far fa-comment-dots"></i>
                      </button>
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
                      <c:set var="year"
                        value="${fn:substring(sysYear,0,4)}" />
                      <c:set var="birthyear"
                        value="${fn:substring(birth,0,4)}" />
                      <c:set var="age" value="${year-birthyear+1}" />
                    </div>

                    <div class="age_gender">
                      <h5>${member.gender},${age} 세</h5>
                    </div>

                    <button onclick="messageShow(this)"
                      value="${member.memberNo}"
                      class="btn btn-just-icon btn-link btn-message">
                      <i class="far fa-comment-dots"></i>
                    </button>

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
                    <label class="information main title">기본 정보</label>
                    <div class="main-info-body">
                      <ul class="test">

                        <c:forEach items="${schoolTeacher}" var="school">
                          <c:if test="${not empty school.schools[1].schoolName}">
                            <li class="school">학교:
                              ${school.schools[1].schoolName}</li>
                          </c:if>
                        </c:forEach>
                        <c:if test="${not empty member.schools[0].major}">
                          <li class="major">전공:
                            ${member.schools[0].major}</li>
                        </c:if>
                        <li class="address">지역:
                          ${member.addressCity} ${member.addressSuburb}</li>
                        <li class="registeredDate">가입일:
                          ${member.registeredDate}</li>
                      </ul>
                    </div>
                  </div>

                  <div class="col-lg-6 col-sm-6">
                    <c:if test="${not empty schoolTeacher[0].schools[0].schoolName}">
                      <label class="information sub title">출신 학교</label><br>
                      <div class="sub-info-body">
                        <ul class="test">
                          <c:forEach items="${schoolTeacher}" var="school">
                            <c:forEach items="${school.schools}"
                              var="school2">
                              <li class="preschool">${school2.schoolName}</li>
                            </c:forEach>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:if>
                  </div>
                </div>
                <!-- row end -->
              </div>
              <hr>


              <div class="lesson-time">
                <label class="lesson-time title">과외 가능 요일/시간</label><br>
                <div class="lesson-time contents">
                  <ul class="test">
                    <li class="subject">${member.schoolType}
                        ${member.subjectName}</li>
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
                        <c:if test="${sun == '1'}">
                                            일요일
                      </c:if>
                        <c:if test="${mon == '1'}">
                                            월요일
                      </c:if>
                        <c:if test="${tue == '1'}">
                                            화요일
                      </c:if>
                        <c:if test="${wed == '1'}">
                                            수요일
                      </c:if>
                        <c:if test="${thu == '1'}">
                                            목요일
                      </c:if>
                        <c:if test="${fri == '1'}">
                                            금요일
                      </c:if>
                        <c:if test="${sat == '1'}">
                                            토요일
                      </c:if>
                      </div>
                    </li>

                    <li>
                      <div class="lesson-time times">
                        ${member.lessonStartTime} ~
                        ${member.lessonEndTime}</div>
                    </li>
                  </ul>
                </div>
              </div>


              <div class="lesson-fee">
                <label class="lesson-fee title">희망 과외 금액</label>
                <div class="lesson-fee contents">
                  <ul class="test">
                    <c:if
                      test="${member.lessonSubjects[0].wantedFee == 1}">
                      <li>20만원 이하</li>
                    </c:if>
                    <c:if
                      test="${member.lessonSubjects[0].wantedFee == 2}">
                      <li>20만원~30만원</li>
                    </c:if>
                    <c:if
                      test="${member.lessonSubjects[0].wantedFee == 3}">
                      <li>30만원~40만원</li>
                    </c:if>
                    <c:if
                      test="${member.lessonSubjects[0].wantedFee == 4}">
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
                  ${member.lessonSubjects[0].subjectContents}
                </div>
              </div>
              <hr>


              <div class="media">
                <label class="media title">미디어</label>
              </div>
              <div class="card-deck">



                <c:forEach var="photo" items="${photoTeacher}">
                  <c:forEach var="photo2" items="${photo.teacherPhotos}">

                    <div class="card">
                      <img
                        src="/upload/teacher_photo/${photo2.teacherPhoto}"
                        class="card-img-top" alt="...">
                    </div>
                  </c:forEach>
                </c:forEach>
              </div>
              <br>
              <br>
              <br>

              <div class="video-container">
                <iframe width="640" height="480"
                  src="${member.teachers[0].videoAddress}"
                  frameborder="0" id="teacher-video" allowfullscreen> </iframe>
              </div>
              <hr>



            <c:if test="${not empty review.teacherReview}">
              <div class="teacher-review">
                <label class="teacher-review title">선생님 후기</label>
                <div class="teacher-review contents">
                  <c:forEach items="${reviewTeacher}" var="review">
                    <div class="card">
                      <div
                        class="card-header card-header-text card-header-primary">
                        <div class="card-text">
                          <h5 class="card-title">ID: ${review.name}&ensp;
                           <c:set var="stars" value="${review.teacherEvaluation}" />
                             <c:if test="${stars == '1'}">
                              <i class="fas fa-star"></i>
                             </c:if>
                              <c:if test="${stars == '2'}">
                              <i class="fas fa-star"></i><i class="fas fa-star"></i>
                             </c:if>
                              <c:if test="${stars == '3'}">
                              <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                             </c:if>
                              <c:if test="${stars == '4'}">
                              <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                             </c:if>
                              <c:if test="${stars == '5'}">
                              <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                             </c:if>
                          </h5> 
                        </div>
                      </div>
                      <div class="card-body">
                       ${review.teacherReview}<br>
                      </div>
                    </div>
                    <br>
                  </c:forEach>
                </div>
              </div>
              </c:if>


            </c:if>
          </c:forEach>
          <!-- 선생님 프로필 bottom end-->

          <!-- 학생 프로필 bottom -->
          <c:forEach items="${detailStudent}" var="member">
            <c:if test="${member.memberTypeNo eq 1}">


              <div class="information">
                <div class="row">
                  <div class="col-lg col-sm">
                    <label class="information main title">기본 정보</label>
                    <div class="main-info-body">
                      <ul class="test">
                        <!-- <li class="school">학교: ${member.schoolType}</li> -->
                        <li class="address">지역:
                          ${member.addressCity} ${member.addressSuburb}</li>
                        <li class="registeredDate">가입일:
                          ${member.registeredDate}</li>
                      </ul>
                    </div>
                  </div>

                  <!-- <div class="col-lg-6 col-sm-6">
                    <label class="information sub title">추가 정보</label><br>
                    <div class="sub-info-body">
                      <ul class="test">
                        <li class="subject">과목:
                          ${member.schoolType} ${member.subjectName}</li>
                      </ul>
                    </div>
                  </div> -->
                </div>
                <!-- row end -->
              </div>
              <hr>


              <div class="lesson-time">
                <label class="lesson-time title">과외 가능 요일/시간</label>
                <div class="lesson-time contents">
                  <ul class="test">
                    <li class="subject">과목:
                        ${member.schoolType} ${member.subjectName}</li>
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
                        <c:if test="${sun == '1'}">
                                            일요일
                      </c:if>
                        <c:if test="${mon == '1'}">
                                            월요일
                      </c:if>
                        <c:if test="${tue == '1'}">
                                            화요일
                      </c:if>
                        <c:if test="${wed == '1'}">
                                            수요일
                      </c:if>
                        <c:if test="${thu == '1'}">
                                            목요일
                      </c:if>
                        <c:if test="${fri == '1'}">
                                            금요일
                      </c:if>
                        <c:if test="${sat == '1'}">
                                            토요일
                      </c:if>
                      </div>
                    </li>

                    <li>
                      <div class="lesson-time times">
                        ${member.lessonStartTime} ~
                        ${member.lessonEndTime}</div>
                    </li>
                  </ul>
                </div>
              </div>


              <div class="lesson-fee">
                <label class="lesson-fee title">희망 과외 금액</label>
                <div class="lesson-fee contents">
                  <ul class="test">
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
              <br><br><br>

            </c:if>
          </c:forEach>

        </div>
        <!-- description text-center end -->
      </div>
      <!-- Container / End -->
    </div>
  </div>

  <script>
  let videoAddress = '${detailTeacher[0].teachers[0].videoAddress}';
  let teacherVideo = document.getElementById('teacher-video');

  let youtubeEmbedAddrStrIndex = videoAddress.search('youtube.com/embed/');
  let youtubeAddrStrIndex = videoAddress.search('youtube.com');
  let youbeAddrStrIndex = videoAddress.search('youtu.be');

  if (youtubeEmbedAddrStrIndex > 0) {

  } else if (youtubeAddrStrIndex > 0) {
    let editedAddr = videoAddress.substring(0, youtubeAddrStrIndex+11);
    console.log(editedAddr);
    editedAddr += '/embed/'+videoAddress.substring(youtubeAddrStrIndex+20);
    teacherVideo.src = editedAddr;
    console.log(editedAddr);

  } else if (youbeAddrStrIndex > 0) {
    let editedAddr = videoAddress.substring(0, youbeAddrStrIndex);
    editedAddr += 'www.youtube.com';
    editedAddr += '/embed'+videoAddress.substring(youbeAddrStrIndex+8);
    teacherVideo.src = editedAddr;

  }
  </script>

  <script>
  function messageShow(memberNo){
	  var url = "/app/message/detail?memberNo="+memberNo.value;
	  var option = "width = 600, height = 600, top = 100, left = 200, location = no"
	  window.open(url, "쪽지목록" ,option);
  }
  </script>


</body>
</html>
