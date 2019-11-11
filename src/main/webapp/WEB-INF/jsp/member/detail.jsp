<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

/*  ul ul.school {
  list-style: none;
  padding-left: 15px;
}

ul li::before {
  content: "\f041"; 
  color: #9c27b0; 
  display: inline-block;
  vertical-align: middle;
  padding: 0px 5px 6px 0px;
} */ */

</style>
<body class="profile-page sidebar-collapse">
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('../assets/img/city-profile.jpg');"></div>
  <div class="main main-raised">
    <div class="profile-content">
      <div class="container">
          <div class="row">
            <div class="col-md-6 ml-auto mr-auto">
              <div class="profile">
              
                 <c:forEach items="${detailTeacher}" var="member">
             <c:if test="${member.memberTypeNo eq 3}">
                <div class="avatar">
                  <img src="/upload/join/${member.profilePhoto}" alt="Circle Image" class="img-raised rounded-circle img-fluid"
                    onError="this.src='/upload/join/default.png'">
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
                </c:if>
                </c:forEach>
                
                <c:forEach items="${detailStudent}" var="member">
             <c:if test="${member.memberTypeNo eq 1}">
                <div class="avatar">
                  <img src="/upload/join/${member.profilePhoto}" alt="Circle Image" class="img-raised rounded-circle img-fluid"
                    onError="this.src='/upload/join/default.png'">
                </div>
                <div class="name">
                  <h2 class="title">${member.name}</h2>
                  <h5>${member.gender},${member.dateOfBirth}</h5>
                  <a href="#pablo" class="btn btn-just-icon btn-link btn-message">
                    <i class="far fa-comment-dots"></i></a> 
                </div>
                </c:if>
                </c:forEach>
                
              </div>
             <hr>
            </div>
          </div>

          <div class="description text-left">
          
          <c:forEach items="${detailTeacher}" var="member">
          <c:if test="${member.memberTypeNo eq 3}">
            <div class="information">
              <div class="information title">
                <h3>기본정보</h3>
              </div>
              <div class="information contents">
                <ul class="school">
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
              <ul>
                <li>${member.schools[0].schoolName}</li>
              </ul>
            </div>
          </div>

          <div class="lesson-subject">
            <div class="lesson-subject title">
              <h3>과목</h3>
            </div>
            <div class="lesson-subject contents">
              <ul>
                <li>${member.schoolType} ${member.subjectName}</li>
              </ul>
            </div>
          </div> 

          <div class="lesson-time">
            <div class="lesson-time title">
              <h3>과외 가능 요일/시간</h3>
            </div>
            <div class="lesson-time contents">
              <ul>
               <li>${member.lessonDays}</li>
               <li>${member.lessonStartTime} ~
                ${member.lessonEndTime}</li>
              </ul>
            </div>
          </div>
          
          <div class="lesson-fee">
            <div class="lesson-fee title">
              <h3>희망 과외 금액</h3>
            </div>
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

          <div class="tch-intro">
            <div class="tch-intro title">
              <h3>자기소개</h3>
            </div>
            <div class="tch-intro contents">
             <ul>
              <li>${member.teachers[0].teacherIntro}<br>
              ${member.lessonSubjects[0].subjectContents}</li>
             </ul>
            </div>
            
            <div class="tch-intro photo">
              <div class="tab-pane active text-center gallery" id="studio">
                <div class="row">
                  <div class="col-md-3 ml-auto">
                    <img src="${member.teacherPhoto}" class="rounded"> 
                    <img  src="${member.teacherPhoto}" class="rounded">
                  </div>
                  <div class="col-md-3 mr-auto">
                    <img src="${member.teacherPhoto}" class="rounded"> 
                    <img src="/landing_images/images/hong.png" class="rounded">
                  </div>
                </div>
              </div>
            </div>
            </div>
            
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
                                    과외과목: ${member.schoolType} ${member.subjectName}<br> 
                                    과외기간: 2018.5 ~ 2019.5<br> 
                                    후기: ${member.lessons[0].teacherReview}<br>
              </div>
             </div>
            </div>
           </div>
         </c:if>
        </c:forEach>
        
        <c:forEach items="${detailStudent}" var="member">
          <c:if test="${member.memberTypeNo eq 1}">
            <div class="information">
              <div class="information title">
                <h3>기본정보</h3>
              </div>
              <div class="information contents">
                <ul class="school">
                  <li>학교: ${member.schoolType} ${member.memberTypeName}</li>
                  <li>지역: ${member.addressCity} ${member.addressSuburb}</li>
                  <li>가입일: ${member.registeredDate}</li>
                </ul>
              </div>
            </div>

          <div class="lesson-subject">
            <div class="lesson-subject title">
              <h3>과목</h3>
            </div>
            <div class="lesson-subject contents">
              <ul>
                <li>${member.schoolType} ${member.subjectName}</li>
              </ul>
            </div>
          </div> 

          <div class="lesson-time">
            <div class="lesson-time title">
              <h3>과외 가능 요일/시간</h3>
            </div>
            <div class="lesson-time contents">
              <input type="hidden" id=days name=days value="${member.lessonDays}"/>
               <div class="sun">
                  <input type="text" id='DAY_1' name="1">
              </div>
               <div>
                  <input type="text" id='DAY_2' name="2">
              </div>
               <div>
                  <input  type="text" id='DAY_3' name="3">
              </div>
               <div>
                  <input type="text" id='DAY_4' name="4">
              </div>
               <div>
                  <input type="text" id='DAY_5' name="5">
              </div>
               <div>
                  <input type="text" id='DAY_6' name="6">
              </div>
               <div>
                  <input type="text" id='DAY_7' name="7">
              </div> 
               ${member.lessonStartTime} ~
                ${member.lessonEndTime}
            </div>
          </div>
          
          <div class="lesson-fee">
            <div class="lesson-fee title">
              <h3>희망 과외 금액</h3>
            </div>
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

            <div class="stu_wanted">
            <div class="stu_wanted title">
              <h3>선생님께 바라는점</h3>
            </div>
            <div class="stu_wanted contents">
              ${member.students[0].requirementsToTeacher}<br>
            </div>
          </div>
          <hr>
          
          <div class="student-review">
            <div class="student-review title">
              <h3>학생 과외 후기</h3>
            </div>
            <div class="student-review contents">
             <div class="card">
              <div class="card-header card-header-text card-header-primary">
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
           
           
           
           
 
  
 
           
           
           
           
           
           
           
           
         </c:if>
        </c:forEach>
        
          </div>
          <!-- description text-center end -->
      </div>
      <!-- Container / End -->
    </div>
  </div>
  
  
  
  
     <script>
  var day = $('#days').val();
  console.log(day); 
  var array = day.split(""); 
  for (var i=0; i<array.length; i++){ 
    console.log(array[i]); 
    if (array[i]==1) { 
      console.log('test');
      $("input:text[id='DAY_"+(i+1)+"']").val(true);
    }  
  }   
</script> 
           

  
  
  
  
  
  
  

</body>

</html>
