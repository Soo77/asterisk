<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

  <style>
    #requestInterruption {
      text-align: right;
    }
    
    #titleTchInfo {
      font-weight: bold;
    }
    
    #titleStdInfo {
      font-weight: bold;
    }
    
    #titleLessonInfo {
      font-weight: bold;
    }
    
    #titleStopReason {
      font-weight: bold;
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
  style="background-image: url('/assets/img/lesson/bg.jpg')">
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
  
    <div class="row">
      <div class="col">
        <div>
          <h4 id="titleLessonInfo">과외 정보</h4>
          <hr>
        </div>
        <div>
          <label for="subject">과목</label>
          <c:choose>
            <c:when test="${lesson.subject.schoolTypeNo eq 1}">
              <input name="subject" id="subject" class="form-control" value="초등 ${lesson.subjectName}" readOnly>
            </c:when>
            <c:when test="${lesson.subject.schoolTypeNo eq 2}">
              <input name="subject" id="subject" class="form-control" value="중등 ${lesson.subjectName}" readOnly>
            </c:when>
            <c:when test="${lesson.subject.schoolTypeNo eq 3}">
              <input name="subject" id="subject" class="form-control" value="고등 ${lesson.subjectName}" readOnly>
            </c:when>
          </c:choose>
        </div>
        <div>
          <label for="teacherName">선생님 이름</label>
          <input name="teacherName" id="teacherName" class="form-control" value="${teacherName}" readOnly>
        </div>
        <div>
          <label for="studentName">학생 이름</label>
          <input name="studentName" id="studentName" class="form-control" value="${studentName}" readOnly>
        </div>
        <div>
          <label for="totalLessonDays">예정된 과외일수</label> <input
            name="totalLessonDays" id="totalLessonDays"
            class="form-control" value="${lesson.curriculum.totalHours}" readOnly>
        </div>
        <div>
          <label for="doneLessonDays">진행된 과외일수</label> <input
            name="email" id="email" class="form-control" value="${lesson.lessonDayCount}"
            readOnly>
        </div>
        <div>
          <label for="residualLessonDays">잔여 과외일수</label> <input
            name="residualLessonDays" id="residualLessonDays"
            class="form-control" value="${lesson.curriculum.totalHours-lesson.lessonDayCount}" readOnly>
        </div>
      </div>
      
      <div class="col">
        <div>
          <h4 id="titleStopReason">중단 사유</h4>
          <hr>
        </div>
        <form id="form1" action="stopLesson" method=post>
          <div>
            <input type="hidden" name="lessonNo" value="${lesson.lessonNo}">
            <textarea name="stopReason" id="stopReason" class="form-control" rows="20" placeholder="중단 사유를 입력하세요."></textarea>
          </div>
        </form>
      </div>
    </div>
    
    <div id="requestInterruption">
      <button type="button" id="btnRequestInterruption" class="btn btn-primary" name="requestInterruption">중단 요청</button>
      <button type="button" id="btnCancel" class="btn btn-danger" name="cancel">취소</button>
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
        location.href = "list?lessonNo=" + ${lesson.lessonNo};
      } else {
      }
    });
  });
</script>
