<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/assets/demo/demo.css" rel="stylesheet" />
<link href="/css/mypage/detail.css" rel="stylesheet" />

<div class="page-header header-filter" data-parallax="true" style="background-image: url('/assets/img/bg3.jpg')">
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
          <h3><b>수업 정보</b></h3>
          <hr>
          <div class="form-group">
            <label for="subjectName">과목 이름</label>
            <c:choose>
              <c:when test="${pendingLessonsInfoMapDetail.lessonInfo.subject.schoolTypeNo eq 1}">
                <input name="subject" id="subject" class="form-control" 
                value="초등 ${pendingLessonsInfoMapDetail.lessonInfo.subjectName}" readOnly>
              </c:when>
              <c:when test="${pendingLessonsInfoMapDetail.lessonInfo.subject.schoolTypeNo eq 2}">
                <input name="subject" id="subject" class="form-control" 
                value="중등 ${pendingLessonsInfoMapDetail.lessonInfo.subjectName}" readOnly>
              </c:when>
              <c:when test="${pendingLessonsInfoMapDetail.lessonInfo.subject.schoolTypeNo eq 3}">
                <input name="subject" id="subject" class="form-control" 
                value="고등 ${pendingLessonsInfoMapDetail.lessonInfo.subjectName}" readOnly>
              </c:when>
            </c:choose>
          </div>
        </div>
      </div>

      <div class="row-fluid">
        <div class="col">
          <h3><b>학생 정보</b></h3>
          <hr>
          <div class="form-group">
            <label for="stdId">이름</label>
            <input type="text" class="form-control" id="stdName" value="${pendingLessonsInfoMapDetail.studentInfo.name}" readonly>
          </div>
  
          <div class="form-group">
            <label for="stdEmail1">이메일</label>
            <input type="text" class="form-control" id="stdEmail1" value="${pendingLessonsInfoMapDetail.studentInfo.email}" name="stdEmail1"
              readonly>
          </div>
          
          <div class="form-group">
            <label for="stdStopReason">학생 중단 사유</label>
            <textarea class="form-control" id="stdStopReason" rows="8" name="stdStopReason"
                readonly>${pendingLessonsInfoMapDetail.lessonInfo.studentStopReason}</textarea>
          </div>
        </div>
      </div>
      
      <div class="row-fluid">
        <div class="col">
          <h3><b>선생님 정보</b></h3>
          <hr>
          <div class="form-group">
            <label for="tchName">이름</label>
            <input type="text" class="form-control" id="tchName" value="${pendingLessonsInfoMapDetail.teacherInfo.name}"readonly>
          </div>
  
          <div class="form-group">
            <label for="tchEmail1">이메일</label>
            <input type="text" class="form-control" id="tchEmail1" value="${pendingLessonsInfoMapDetail.teacherInfo.email}" name="tchEmail1"
              readonly>
          </div>
          
          <div class="form-group">
            <label for="tchStopReason">선생님 중단 사유</label>
            <textarea class="form-control" id="tchStopReason" rows="8" name="tchStopReason"
                readonly>${pendingLessonsInfoMapDetail.lessonInfo.teacherStopReason}</textarea>
          </div>
        </div>
      </div>
      
      <div class="row-fluid">
        <div class="col">
          <h3><b>수업 정산</b></h3>
          <hr>
          <div class="form-group">
            <label for="lessonFee">월 수업료</label>
            <input type="text" class="form-control" id="lessonFee" 
            value="${pendingLessonsInfoMapDetail.lessonInfo.lessonFee}" name="lessonFee"
              readonly>
          </div>
          
          <div class="form-group">
            <label for="lessonFee">한달 수업일수</label>
            <input type="text" class="form-control" id="lessonFee" 
            value="${pendingLessonsInfoMapDetail.dayLessonCountOfMonth}" name="lessonFee"
              readonly>
          </div>
          
          <div class="form-group">
            <label for="lessonFee">이번 달에 진행된 수업일수</label>
            <input type="text" class="form-control" id="lessonFee" 
            value="${pendingLessonsInfoMapDetail.progressDayLessonCountOfMonth}" name="lessonFee"
              readonly>
          </div>
          
          <div class="form-group">
            <label for="lessonFee">잔여 수업일수</label>
            <input type="text" class="form-control" id="lessonFee" 
            value="${pendingLessonsInfoMapDetail.dayLessonCountOfMonth
            - pendingLessonsInfoMapDetail.progressDayLessonCountOfMonth}" name="lessonFee"
              readonly>
          </div>
          
          <div class="form-group">
            <label for="lessonFee">환불금액</label>
            <input type="text" class="form-control" id="lessonFee" 
            value="${pendingLessonsInfoMapDetail.refund}" name="lessonFee"
              readonly>
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
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonClass: "btn-danger",
	      confirmButtonText: "Confirm",
	      closeOnConfirm: false
	    })
	    .then(() => {
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
	    });
  });
</script>

