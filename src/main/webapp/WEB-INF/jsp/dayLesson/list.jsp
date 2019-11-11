<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

  <!--Google Fonts-->
  <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
  
    <!--Simple Cale Calender CSS-->
  <link rel="stylesheet" href="css/simple-calendar.css">
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
          <h1>과외진행현황</h1>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container p-3">
    <div id="container" class="calendar-container">
    </div>
    
    <hr>

    <div class="progress-container progress-primary">
      <span class="progress-badge">남은 일수</span>
      <div class="progress">
        <div class="progress-bar progress-bar-primary"
          role="progressbar" aria-valuenow="30" aria-valuemin="0"
          aria-valuemax="100" style="width: 30%;"></div>
      </div>
    </div>

    <c:forEach items="${dayLessons}" var="dayLesson" varStatus="i">
      <div class="card">
        <div class="card-body">
          <div class="row">
            <div class="col">수업일 : ${dayLesson.lessonDate}</div>
            <div class="col">수업시간 : ${dayLesson.lessonStartHour} ~ ${dayLesson.lessonEndHour}</div>
          </div>
          <hr>
          <div class="row">
            <div class="col">${dayLesson.lessonSummary}</div>
          </div>
          <div class="row" id="myBtnDetail">
            <!-- Button trigger modal -->
              <button type="button" class="btn btn-primary"
                data-toggle="modal" data-target="#detailModal">
                상세보기</button>
                
                <button id="myBtn" class="myBtn" onclick="ShowModal('${i.index}')">Open Modal</button>
          </div>
          
        </div>
      </div>
    </c:forEach>
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
          <label for="lessonSummary">수업 내용 정리</label>
          <textarea id="lessonSummary" class="form-control"
name="lessonSummary" rows="10" style="resize: none;">${dayLesson.lessonSummary}</textarea>
        </div>
        <div class="row">
          <label for="lessonEvaluation">수업 평가</label>
          <textarea id="lessonEvaluation" class="form-control"
name="lessonEvaluation" rows="5" style="resize: none;">${dayLesson.lessonEvaluation}</textarea>
        
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

<script src="/node_modules/jquery/dist/jquery.min.js"></script>



<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

<!--jQuery js-->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

  <!--Simple Calender Js-->
<script src="js/jquery.simple-calendar.js"></script>
  
<script>
  $(document).ready(function(){
  	  
  	$("#container").simpleCalendar();
  
  });
  
  $("#container").simpleCalendar({
      //Defaults options below
      //string of months starting from january
      months: ['january','february','march','april','may','june','july','august','september','october','november','december'],
      days: ['sunday','monday','tuesday','wednesday','thursday','friday','saturday'], //string of days starting from sunday
      minDate : "YYYY-MM-DD",         // minimum date
      maxDate : "YYYY-MM-DD",         // maximum date
      insertEvent: true,              // can insert events
      displayEvent: true,             // display existing event
      fixedStartDay: true,            // Week begin always by monday
      event: [],                      // List of events
      insertCallback : function(){}   // Callback when an event is added to the calendar
  });
</script>



