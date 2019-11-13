<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

  <!--Google Fonts-->
  <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
  
  <!--Simple Cale Calender CSS-->
  <link rel="stylesheet" href="/css/simple-calendar.css">
  
  <!--Simple Calender Js-->
  <script src="/js/jquery.simple-calendar.js"></script>

  <style>
    #myBtnDetail {
      text-align: right;
    }
  </style>
  
</head>

<div class="page-header header-filter" data-parallax="true"
  style="background-image: url('assets/img/bg3.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>과외 진행현황</h1>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container p-3">
    <div id="container" class="calendar-container p-5"></div>
    <hr>

    <div class="progress-container progress-primary">
      <span class="progress-badge">남은 일수</span>
      <div class="progress">
        <div class="progress-bar progress-bar-primary"
          role="progressbar" aria-valuenow="30" aria-valuemin="0"
          aria-valuemax="100" style="width: 30%;"></div>
      </div>
    </div>
    
    <input type="hidden" name="lessonNo" value="${memberInfoMap.teacherLessons[1].lessonNo}">
    <div class="dayLessonList">
    
    </div>
    
<!--      <c:forEach items="${dayLessons}" var="dayLesson" varStatus="i">
      <div class="card">
        <div class="card-body">
          <div class="row">
            수업일 : <div class="col" id="lessonDate_${i.index}">${dayLesson.lessonDate}</div>
            수업시간 : <div class="col" id="lessonTime_${i.index}">${dayLesson.lessonStartHour} ~ ${dayLesson.lessonEndHour}</div>
          </div>
          <hr>
          <div class="row">
            <div class="col" id="lessonSummary_${i.index}">${dayLesson.lessonSummary}</div>
            <input type='hidden' id="lessonEvaluation_${i.index}" value='${dayLesson.lessonEvaluation}'>
          </div>
          <div class="row" id="myBtnDetail">
            <div class="col">
              <button type="button" class="btn btn-primary btn-sm .modal-param" 
              data-toggle="modal" data-target="#detailModal"
               data-unique="${i.index}" onclick="setModal(${i.index})">상세보기 </button>
            </div>
          </div>
        </div>
      </div>
    </c:forEach> -->
    
  </div>
</div>

<!-- Modal -->
  <div class="modal fade" id="detailModal" tabindex="-1"
  role="dialog" aria-labelledby="detailModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="detailModalLabel">일별 과외 진행현황</h5>
        <button type="button" class="close"
          data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <label for="lessonDate">수업일</label>
            <div class="col" id="modalLessonDate">${dayLesson.lessonDate}</div>
          </div>
          <div class="col">
            <label for="lessonTime">수업 시간</label>
            <div class="col" id="modalLessonTime"></div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label for="lessonSummary">수업 내용 정리</label>
            <textarea id="modalLessonSummary" class="form-control"
            name="lessonSummary" rows="10" style="resize: none;"></textarea>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <label for="lessonEvaluation">수업 평가</label>
            <textarea id="modalLessonEvaluation" class="form-control"
            name="lessonEvaluation" rows="5" style="resize: none;"></textarea>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"
          data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>

<script src="/js/jquery.simple-calendar.js"></script>

<script>
$(document).ready(function() {
	$("#container").simpleCalendar({
		fixedStartDay : false
	});
	
});
</script>
<script>
	
  var lessonNo = Number('${memberInfoMap.teacherLessons[1].lessonNo}');

	function loadData() { 
  $.ajax({
      url : 'dayLesson/list',
      type : 'get',
      data : {
        'lessonNo' : lessonNo
      },
      success : function(data) {
        var a = '';

        var tempdayLessonNo = '';
        var tempSummary = '';
        var tempEvaluation = '';

        var thisNode = '';
        
        $.each(
                data,
                function(key, value) {
                  a='';
                	a += '<div class="card">';
                	a += '<div class="card-body">';
                	a += '<div class="row">';
            			a += '수업일 : <div class="col" id="lessonDate_' + value.dayLessonNo + '">' + value.lessonDate + '</div>';
            			a += '수업시간 : <div class="col" id="lessonTime_' + value.dayLessonNo + '">' + value.lessonStartHour + '~' + value.lessonEndHour + '</div>';
            			a += '</div>';
          				a += '<hr>';
        					a += '<div class="row">';
      						a += '<div class="col" id="lessonSummary_' + value.dayLessonNo + '"></div>';
      						a += "<input type='hidden' id='lessonEvaluation_" + value.dayLessonNo + "' value=''>";
      						a += '</div>';
    							a += '<div class="row" id="myBtnDetail">';
  								a += '<div class="col">';
									a += '<button type="button" class="btn btn-primary btn-sm .modal-param" data-toggle="modal" data-target="#detailModal" data-unique="' + value.dayLessonNo + '"' +  'onclick="setModal(' + value.dayLessonNo + ')">상세보기 </button>';
									a += '</div>';
									a += '</div>';
									a += '</div>';
                  a += '</div>';

                  $(".dayLessonList").append(a);

                  thisNode = document.getElementById('lessonSummary_'+value.dayLessonNo);
                  thisNode.innerHTML = value.lessonSummary;
                  thisNode = document.getElementById('lessonEvaluation_'+value.dayLessonNo);
                  thisNode.setAttribute('value', value.lessonEvaluation);

                });

      }
  });
}

	$(document).ready(function() {
		loadData();
	});
</script>

<script>
  function setModal(key) {
	  var lessonDate = $("#lessonDate_" + key).text();
	  $("#modalLessonDate").text(lessonDate);
	    
    var lessonTime = $("#lessonTime_" + key).text();
    $("#modalLessonTime").text(lessonTime);
    
    var summary = $("#lessonSummary_" + key).text();
    $("#modalLessonSummary").val(summary);
    
    var evaluation = $("#lessonEvaluation_" + key).val();
    $("#modalLessonEvaluation").val(evaluation);
  }
</script>

