<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

  <style>
    #requestInterruption {
      text-align: right;
    }
    
    #stopReason {
      background-image: linear-gradient(to top, #9c27b0 2px, rgba(156, 39, 176, 0) 2px),
        linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);
      border: 0.5px solid #d2d2d2;
      border-radius: .25rem;
    }
  </style>
  
</head>

<div class="page-header header-filter" data-parallax="true"
  style="background-image: url('/assets/img/lesson/bg4.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>과외 중단</h1>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container p-3">
  
    <div class="row-fluid">
      <div class="col">
        <h3><b>과외 정보</b></h3>
        <hr>
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
      </div>
    </div>

    <div class="row-fluid mt-5">
      <div class="col">
        <h3>
          <b>중단 사유</b>
        </h3>
        <hr>
        <div class="form-group pt-0">
          <form id="form1" action="stopLesson" method=post>
            <div>
              <input type="hidden" name="lessonNo"
                value="${lessonNo}">
              <textarea name="stopReason" id="stopReason"
                class="form-control pl-2" rows="8"
                placeholder="중단 사유를 입력하세요."></textarea>
            </div>
          </form>
        </div>
      </div>
    </div>

  <c:if test="${loginUser.memberTypeNo == 1 || loginUser.memberTypeNo == 2}">
    <div class="row-fluid mt-5">
      <div class="col">
        <h3>
          <b>과외비 정산</b>
        </h3>
        <hr>
        <div class="form-group">
<%--           <label for="lessonFee">월 과외료</label> <input type="text"
            class="form-control" id="lessonFee"
            value="${pendingLessonsInfoMapDetail.lessonInfo.lessonFee}"
            name="lessonFee" readonly> --%>
            
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
<%--           <label for=dayLessonCountOfMonth>한달 과외일수</label> <input
            type="text" class="form-control" id="dayLessonCountOfMonth"
            value="${pendingLessonsInfoMapDetail.dayLessonCountOfMonth}"
            name="dayLessonCountOfMonth" readonly> --%>
            
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
<%--           <label for="progressDayLessonCountOfMonth">이번 달에 진행된 과외일수</label> <input
            type="text" class="form-control" id="progressDayLessonCountOfMonth"
            value="${pendingLessonsInfoMapDetail.progressDayLessonCountOfMonth}"
            name="progressDayLessonCountOfMonth" readonly> --%>
          
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
<%--           <label for="remainingLessonDay">잔여 과외일수</label> <input
            type="text" class="form-control" id="remainingLessonDay"
            value="${pendingLessonsInfoMapDetail.dayLessonCountOfMonth
          - pendingLessonsInfoMapDetail.progressDayLessonCountOfMonth}"
            name="remainingLessonDay" readonly> --%>
            
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
<%--           <label for="refund">환불금액</label> <input type="text"
            class="form-control" id="refund"
            value="${pendingLessonsInfoMapDetail.refund}"
            name="refund" readonly> --%>
            
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
      </div>
    </div>
  </c:if>
  
    <div class="row-fluid mt-5">
      <div class="col">
        <div id="requestInterruption">
          <button type="button" id="btnRequestInterruption" class="btn btn-primary" name="requestInterruption">중단  요청</button>
          <button type="button" id="btnCancel" class="btn btn-danger" name="cancel">취소</button>
        </div>
      </div>
    </div>
      
  </div>
</div>

<script>
  var requestInterruptionButton = document.querySelector('#btnRequestInterruption');
  requestInterruptionButton.addEventListener('click', function() {
    var stopReason = $("#stopReason").val().replace(/(\s*)/g, "");
    if (stopReason.length == 0) {
      swal("중단 사유를 입력하세요.");
      return;
    } else {
      swal({
          title: "중단 신청",
          text: "중단 신청은 취소가 불가능합니다.\n중단 신청을 하시면 일별과외 진행현황은 조회만 가능합니다.",
          buttons: true,
        })
        .then((willDelete) => {
          if (willDelete) {
            swal("신청되었습니다.", {
              icon: "success",
            });
            document.getElementById("form1").submit();
          } else {
          }
        });
    }
  });
  
  var cancelButton = document.querySelector('#btnCancel');
  cancelButton.addEventListener('click', function() {
    swal({
      title: "취소",
      text: "취소하시겠습니까?",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        location.href = "list?lessonNo=" + ${lessonNo};
      } else {
      }
    });
  });
</script>
