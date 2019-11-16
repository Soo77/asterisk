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
  </style>
  
</head>

<div class="page-header header-filter" data-parallax="true"
  style="background-image: url('assets/img/bg3.jpg')">
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
          <c:if test="${loginUser.memberTypeNo == 3}">
            <h4 id="titleTchInfo">선생님 정보</h4>
            <hr>
          </c:if>
          <c:if test="${loginUser.memberTypeNo == 1}">
            <h4 id="titleStdInfo">학생 정보</h4>
            <hr>
          </c:if>
        </div>
        <div>
          <label for="name">이름</label>
          <input name="name" id="name" class="form-control" value="${name}" readOnly>
        </div>
        <div>
          <label for="email">이메일</label>
          <input name="email" id="email" class="form-control" value="${email}" readOnly>
        </div>
        
        <br>
        
        <div>
          <h4 id="titleLessonInfo">수업 정보</h4>
          <hr>
        </div>
        <div>
          <label for="subject">과목</label>
          <c:choose>
            <c:when test="${schoolTypeNo eq 1}">
              <input name="subject" id="subject" class="form-control" value="초등 ${subjectName}" readOnly>
            </c:when>
            <c:when test="${schoolTypeNo eq 2}">
              <input name="subject" id="subject" class="form-control" value="중등 ${subjectName}" readOnly>
            </c:when>
            <c:when test="${schoolTypeNo eq 3}">
              <input name="subject" id="subject" class="form-control" value="고등 ${subjectName}" readOnly>
            </c:when>
          </c:choose>
        </div>



        <div>
          <label for="totalLessonDays">총 소요일수</label> <input
            name="totalLessonDays" id="totalLessonDays"
            class="form-control" value="${totalHours}" readOnly>
        </div>
        <div>
          <label for="doneLessonDays">수업 진행일수</label> <input
            name="email" id="email" class="form-control" value="${lessonDayCount}"
            readOnly>
        </div>
        <hr>
        <div>
          <label for="residualLessonDays">잔여 수업일수</label> <input
            name="residualLessonDays" id="residualLessonDays"
            class="form-control" value="${totalHours-lessonDayCount}" readOnly>
        </div>
      </div>
      
      <div class="col">
        <div>
          <h4 id="titleStopReason">중단 사유</h4>
          <hr>
        </div>
        <form id="form1" action="stopLesson" method=post>
          <div>
            <input type="hidden" name="lessonNo" value="${lessonNo}">
            <textarea name="stopReason" id="stopReason" class="form-control" rows="26" placeholder="중단 사유를 입력하세요."></textarea>
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
        }
        else {
          swal({
              title: "중단신청",
              text: "신청하시겠습니까?",
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

