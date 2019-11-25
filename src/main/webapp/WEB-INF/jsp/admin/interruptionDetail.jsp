<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/assets/demo/demo.css" rel="stylesheet" />
<link href="/css/mypage/detail.css" rel="stylesheet" />

<div class="page-header header-filter" data-parallax="true" style="background-image: url('/assets/img/bg/bg15.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>관리자 페이지</h1>
          <h3 class="title text-center">과외 중단</h3>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container pt-3">
      <div class="row-fluid">
        <div class="col">
          <h3><b>과외 정보</b></h3>
          <hr>
          <div class="form-group">
            <label for="lessonNo">과외 번호</label>
            <input type="text" class="form-control pl-2" id="lessonNo" value="${pendingLessonsInfoMapDetail.lessonInfo.lessonNo}" readonly>
          </div>
          
          <div class="form-group">
            <label for="subjectName">과목 이름</label>
            <c:choose>
              <c:when test="${pendingLessonsInfoMapDetail.lessonInfo.subject.schoolTypeNo eq 1}">
                <input name="subject" id="subject" class="form-control pl-2" 
                value="초등 ${pendingLessonsInfoMapDetail.lessonInfo.subjectName}" readOnly>
              </c:when>
              <c:when test="${pendingLessonsInfoMapDetail.lessonInfo.subject.schoolTypeNo eq 2}">
                <input name="subject" id="subject" class="form-control pl-2" 
                value="중등 ${pendingLessonsInfoMapDetail.lessonInfo.subjectName}" readOnly>
              </c:when>
              <c:when test="${pendingLessonsInfoMapDetail.lessonInfo.subject.schoolTypeNo eq 3}">
                <input name="subject" id="subject" class="form-control pl-2" 
                value="고등 ${pendingLessonsInfoMapDetail.lessonInfo.subjectName}" readOnly>
              </c:when>
            </c:choose>
          </div>
        </div>
      </div>

      <div class="row-fluid mt-5">
        <div class="col">
          <h3><b>학생 정보</b></h3>
          <hr>
          <div class="form-group">
            <label for="stdId">이름</label>
            <input type="text" class="form-control pl-2" id="stdName" value="${pendingLessonsInfoMapDetail.studentInfo.name}" readonly>
          </div>
  
          <div class="form-group">
            <label for="stdEmail1">이메일</label>
            <input type="text" class="form-control pl-2" id="stdEmail1" value="${pendingLessonsInfoMapDetail.studentInfo.email}" name="stdEmail1"
              readonly>
          </div>
          
          <div class="form-group">
            <label for="stdStopReason">중단 사유</label>
            <textarea class="form-control pl-2" id="stdStopReason" rows="8" name="stdStopReason"
                readonly>${pendingLessonsInfoMapDetail.lessonInfo.studentStopReason}</textarea>
          </div>
        </div>
      </div>
      
      <div class="row-fluid mt-5">
        <div class="col">
          <h3><b>선생님 정보</b></h3>
          <hr>
          <div class="form-group">
            <label for="tchName">이름</label>
            <input type="text" class="form-control pl-2" id="tchName" value="${pendingLessonsInfoMapDetail.teacherInfo.name}"readonly>
          </div>
  
          <div class="form-group">
            <label for="tchEmail1">이메일</label>
            <input type="text" class="form-control pl-2" id="tchEmail1" value="${pendingLessonsInfoMapDetail.teacherInfo.email}" name="tchEmail1"
              readonly>
          </div>
          
          <div class="form-group">
            <label for="tchStopReason">중단 사유</label>
            <textarea class="form-control pl-2" id="tchStopReason" rows="8" name="tchStopReason"
                readonly>${pendingLessonsInfoMapDetail.lessonInfo.teacherStopReason}</textarea>
          </div>
        </div>
      </div>
      
      <div class="row-fluid mt-5">
        <div class="col">
          <h3><b>수업 정산</b></h3>
          <hr>
          <div class="form-group">
            <label for="lessonFee">월 과외료</label>
            <div class="form-group has-default bmd-form-group pt-0">
              <div class="d-flex">
                <div class="flex-item" style="flex-basis: 99%;">
                  <input id="lessonFee" name=lessonFee type="text" class="form-control pl-2"
                    value="${pendingLessonsInfoMapDetail.lessonInfo.lessonFee}" readonly>
                </div>
                <div class="flex-item align-self-center pl-1" style="flex-basis: 1%;">
                  <span>원</span>
                </div>
              </div>
            </div>
        </div>

        <div class="form-group">
          <label for="dayLessonCountOfMonth">한달 과외일수</label>
          <div class="form-group has-default bmd-form-group pt-0">
            <div class="d-flex">
              <div class="flex-item" style="flex-basis: 99%;">
                <input id="dayLessonCountOfMonth" name=dayLessonCountOfMonth type="text" class="form-control pl-2"
                  value="${pendingLessonsInfoMapDetail.dayLessonCountOfMonth}" readonly>
              </div>
              <div class="flex-item align-self-center pl-1" style="flex-basis: 1%;">
                <span>일</span>
              </div>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label for="progressDayLessonCountOfMonth">진행된 과외일수</label>
          <div class="form-group has-default bmd-form-group pt-0">
            <div class="d-flex">
              <div class="flex-item" style="flex-basis: 99%;">
                <input id="progressDayLessonCountOfMonth" name=progressDayLessonCountOfMonth type="text" class="form-control pl-1"
                  value="${pendingLessonsInfoMapDetail.progressDayLessonCountOfMonth}" readonly>
              </div>
              <div class="flex-item align-self-center pl-1" style="flex-basis: 1%;">
                <span>일</span>
              </div>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label for="remainingLessonDay">잔여 과외일수</label>
          <div class="form-group has-default bmd-form-group pt-0">
            <div class="d-flex">
              <div class="flex-item" style="flex-basis: 99%;">
                <input id="remainingLessonDay" name=remainingLessonDay type="text" class="form-control pl-2"
                  value="${pendingLessonsInfoMapDetail.dayLessonCountOfMonth
          - pendingLessonsInfoMapDetail.progressDayLessonCountOfMonth}" readonly>
              </div>
              <div class="flex-item align-self-center pl-1" style="flex-basis: 1%;">
                <span>일</span>
              </div>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label for="refund">환불 금액</label>
          <div class="form-group has-default bmd-form-group pt-0">
            <div class="d-flex">
              <div class="flex-item" style="flex-basis: 99%;">
                <input id="refund" name=refund type="text" class="form-control pl-2"
                  value="${pendingLessonsInfoMapDetail.refund}" readonly>
              </div>
              <div class="flex-item align-self-center pl-1" style="flex-basis: 1%;">
                <span>원</span>
              </div>
            </div>
          </div>
        </div>
          
          <div class="pt-2 pb-2 text-right">
            <button type="button" class="btn btn-danger" id="approveIntteruption">중단 승인</button>
          </div>
        </div>
      </div>
  </div>
</div>

<script>
  let approveIntteruption = document.getElementById('approveIntteruption');
  approveIntteruption.addEventListener('click', () => {
	  swal({
      title: "중단 승인",
      text: "중단을 승인합니다.",
      buttons: true,
    })
    .then((willDelete) => {
      if (willDelete) {
    	  $.ajax({
  	        url:'/app/admin/approveIntteruption',
  	        method: 'post',
  	        data : {
  	          'lessonNo': Number('${pendingLessonsInfoMapDetail.lessonInfo.lessonNo}')
  	        },
  	        success: (result) => {
  	          location.href="/app/admin/list";
  	        }
  	      });
      } else {
      }
    });
  });
</script>

