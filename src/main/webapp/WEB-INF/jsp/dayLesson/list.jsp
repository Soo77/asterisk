<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<link rel="stylesheet" href="/css/simple-calendar.css">

<style>
  
  /* 캘린더 month 이동하는 버튼 */
  .calendar header .btn {
    color: #D8D8D8;
    border: 2px solid #D8D8D8;
    background-color: white;
    padding: 0px;
  }
  
  /* 캘린더 오늘 날짜 */
  .calendar .day.today {
    background: #FFE08C;
    color: black;
  }
  
  /* 캘린더 날짜 누르고 뜬 화면에서 'x' */
  .event-container>.close:before, .event-container>.close:after {
    background-color: black;
  }
  
  /* 캘린더 날짜 누르고 뜬 화면 */
  .calendar .event-container {
    color: black;
    background: #EAEAEA;
  }
  
  /* 캘린더 날짜 누르고 뜬 화면에서 날짜 */
  .event-container>p {
    margin-top: 10%;
  }
  
  /* 캘린더 날짜 누르고 뜬 화면에서 내용 */
  h2.title {
    color: black;
    font-size: 20px;
  }
  
  #my-progress {
    padding: 20px;
  }
  
  #reaminDays {
    text-align: right;
  }
  
  #stopAndAdd {
    text-align: right;
  }
  
  #dayLessonAdd {
    display: inline-block;
  }
  
  #dayLessonStop {
    display: inline-block;
  }
  
  #myBtnDetail {
    text-align: right;
  }
  
  .modal-title {
    font-weight: bold;
  }

  .myDayLessonInsertForms .row {
    padding: 10px 0px;
  }
  
  .myDayLessonInsertForms .form-control {
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
          <h1>과외 진행현황</h1>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container pt-5 pb-4" style="padding-left: 45px; padding-right: 45px;">
  
    <c:forEach var="dayLesson" items="${dayLessons}" varStatus="status">
      <input type="hidden" name="hiddenLessonDate" id="dayLessonDate${status.index}" value="${dayLesson.lessonDate}">
      <input type="hidden" name="hiddenLessonSummary" id="dayLessonSummary${status.index}" value="${dayLesson.lessonSummary}">
    </c:forEach>

    <div class="row">
      <div class="col">
        <div>
          <a href="../lesson/list?memberTypeNo=${loginUser.memberTypeNo}"
            class="btn btn-primary" id="lessonList">과외목록</a>
        </div>
      </div>
      <div class="col" id="stopAndAdd">
        <c:if test="${loginUser.memberTypeNo == 3 && lessonState == 1}">
          <div id="dayLessonAdd">
            <button type="button" class="btn btn-primary"
              data-toggle="modal" data-target="#modal" id="btnDayLessonAdd"
              onclick="resetModal()">추가</button>
          </div>
        </c:if>
        <c:if test="${lessonState == 1}">
          <div id="dayLessonStop">
            <a href="stopLessonForm?lessonNo=${lessonNo}"
            class="btn btn-danger" id="requestLessonInterrupt">과외중단</a>
          </div>
        </c:if>
      </div>
    </div>

    <div class="row">
      <div class="col">
        <div id="container" class="calendar-container p-1"></div>
      </div>
    </div>

    <div class="row">
      <div class="col" id="my-progress">
        <div class="progress-container progress-primary">
          <div class="row">
            <div class="col">
              <span class="progress-badge">${percent} %</span>
            </div>
            <div class="col" id="reaminDays">
              <span class="progress-badge">남은 일수 : ${remainDays} 일</span>
            </div>
          </div>
          <div class="progress">
            <div class="progress-bar progress-bar-primary"
              role="progressbar" aria-valuenow="30" aria-valuemin="0"
              aria-valuemax="100" style="width: ${percent}%;"></div>
          </div>
        </div>
      </div>
    </div>
    
    

    <!-- 일별 과외 진행현황 리스트 -->
    <div class="dayLessonList">
    
    </div>
    
  </div>
</div>

<!-- Modal -->
  <div class="modal fade" id="modal" tabindex="-1"
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
        <input name="dayLessonNo" type="hidden" id="modalDayLessonNo" value="">
        
        <form name="dayLessonInsertForm" class="myDayLessonInsertForms">
          <input name="lessonNo" type="hidden" id="modalLessonNo" value="${lessonNo}">
          <div class="row">
            <div class="col">
              <label for="modalLessonDate">날짜</label>
              <input class="form-control pl-2" name="lessonDate" id="modalLessonDate" type="date" value="" max="9999-12-31">
            </div>
          </div>
          <div class="row">
            <div class="col">
              <label for="modalLessonStartHour">시작 시간</label>
              <input class="form-control pl-2" name="lessonStartHour" id="modalLessonStartHour" type="time" value="${curLessonSt}">
            </div>
            <div class="col">
              <label for="modalLessonEndHour">종료 시간</label>
              <input class="form-control pl-2" name="lessonEndHour" id="modalLessonEndHour" type="time" value="${curLessonEt}">
            </div>
          </div>
          <div class="row">
            <div class="col">
              <label for="lessonSummary">내용 정리</label>
              <textarea id="modalLessonSummary" class="form-control pl-2"
              name="lessonSummary" rows="10" style="resize: none;"></textarea>
            </div>
          </div>
          <div class="row">
            <div class="col">
              <label for="lessonEvaluation">평가</label>
              <textarea id="modalLessonEvaluation" class="form-control pl-2"
              name="lessonEvaluation" rows="5" style="resize: none;"></textarea>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <div class="row">
          <div class="col">
            <c:if test="${loginUser.memberTypeNo == 3 && lessonState == 1}">
              <button type="button" id="btnAdd" class="btn btn-primary" name="dayLessonInsertBtn">등록</button>
              <button type="button" id="btnUpdate" class="btn btn-primary">수정</button>
              <button type="button" id="btnDelete" class="btn btn-danger" name="dayLessonDeleteBtn" onclick="dayLessonDelete()">삭제</button>
            </c:if>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="/js/jquery.simple-calendar.js"></script>

<script>

	$(document).ready(function(){
		$("#container").simpleCalendar();
	});
	
	// 일별과외진행현황 날짜들을 리스트에 저장
	var lessonDateList = new Array();
  $("input[name=hiddenLessonDate]").each(function(idx) {
	  lessonDateList.push($(this).val());
  });
  
  var lessonSummaryList = new Array();
  $("input[name=hiddenLessonSummary]").each(function(idx) {
	  lessonSummaryList.push($(this).val());
  });
  
  // lessonDateList 리스트를 가지고 캘린더에 일별과외진행현황 날짜 표시
  $("#container").simpleCalendar({
      months: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
      days: ['일','월','화','수','목','금','토'],
      minDate : "YYYY-MM-DD",         // minimum date
      maxDate : "YYYY-MM-DD",         // maximum date
      insertEvent: true,              // can insert events
      displayEvent: true,             // display existing event
      fixedStartDay: true,            // Week begin always by monday
      events: lessonDateList,        // event dates
      eventsInfo: lessonSummaryList,     // event info to show
      insertCallback : function(){}   // Callback when an event is added to the calendar
  }); 
  
</script>

<script>
	
  var lessonNo = '${lessonNo}';
  
  // 일별 과외 진행현황 등록 버튼 클릭시 
  $('[name=dayLessonInsertBtn]').click(function() {
    var modalLessonDate = $("#modalLessonDate").val().replace(/(\s*)/g, "");
    var modalLessonStartHour = $("#modalLessonStartHour").val().replace(/(\s*)/g, "");
    var modalLessonEndHour = $("#modalLessonEndHour").val().replace(/(\s*)/g, "");
    var modalLessonSummary = $("#modalLessonSummary").val().replace(/(\s*)/g, "");
    var modalLessonEvaluation = $("#modalLessonEvaluation").val().replace(/(\s*)/g, "");
    
    if (modalLessonDate.length == 0) {
    	swal("과외일을 입력하세요.");
    } else if (modalLessonStartHour.length == 0) {
    	swal("과외 시작시간을 입력하세요.");
    } else if (modalLessonEndHour.length == 0) {
    	swal("과외 종료시간을 입력하세요.");
    } else if (modalLessonSummary.length == 0) {
    	swal("과외 내용 정리를 입력하세요.");
    } else if (modalLessonEvaluation.length == 0) {
    	swal("과외 평가를 입력하세요.");
    } else if (${remainDays == 1}) {
  		swal({
  	        title: "등록",
  	        text: "과외의 마지막 날입니다.\n확인을 누르시면 과외가 종료됩니다.",
  	        buttons: true,
  	      })
  	      .then((willDelete) => {
  	        if (willDelete) {
  	          swal("수정되었습니다.", {
  	            icon: "success",
  	          });
  	          var insertData = $('[name=dayLessonInsertForm]').serialize();
  	          dayLessonInsert(insertData);
  	        } else {
  	        	
  	        }
  	      });
  	} else {
    	var insertData = $('[name=dayLessonInsertForm]').serialize();
      dayLessonInsert(insertData);
    }
  });
  
	//일별 과외 진행현황 수정 버튼 클릭시 
  $('#btnUpdate').click(function() {
    var modalLessonDate = $("#modalLessonDate").val().replace(/(\s*)/g, "");
    var modalLessonStartHour = $("#modalLessonStartHour").val().replace(/(\s*)/g, "");
    var modalLessonEndHour = $("#modalLessonEndHour").val().replace(/(\s*)/g, "");
    var modalLessonSummary = $("#modalLessonSummary").val().replace(/(\s*)/g, "");
    var modalLessonEvaluation = $("#modalLessonEvaluation").val().replace(/(\s*)/g, "");
    
    if (modalLessonDate.length == 0) {
    	swal("과외일을 입력하세요.");
    } else if (modalLessonStartHour.length == 0) {
    	swal("과외 시작시간을 입력하세요.");
    } else if (modalLessonEndHour.length == 0) {
    	swal("과외 종료시간을 입력하세요.");
    } else if (modalLessonSummary.length == 0) {
    	swal("과외 내용 정리를 입력하세요.");
    } else if (modalLessonEvaluation.length == 0) {
    	swal("과외 평가를 입력하세요.");
    } else {
    	dayLessonUpdate()
    }
  });
  
  // 일별 과외 진행현황 리스트
	function dayLessonList() { 
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
                  	a += "<input type='hidden' id='dayLessonNo_" + value.dayLessonNo + "' value='" + value.dayLessonNo + "'>";
                  	a += '<div class="row pl-3 pr-3">';
              			a += '과외일 : <div class="col" id="lessonDate_' + value.dayLessonNo + '">' + value.lessonDateStr + '</div>';
              			a += '시작 시간 : <div class="col" id="lessonStartHour_' + value.dayLessonNo + '">' + value.lessonStartHour + '</div>';
              			a += '종료 시간 : <div class="col" id="lessonEndHour_' + value.dayLessonNo + '">' + value.lessonEndHour + '</div>';
              			a += '</div>';
            				a += '<hr>';
          					a += '<div class="row">';
        						a += '<div class="col" id="lessonSummary_' + value.dayLessonNo + '"></div>';
        						a += "<input type='hidden' id='lessonEvaluation_" + value.dayLessonNo + "' value=''>";
        						a += '</div>';
      							a += '<div class="row" id="myBtnDetail">';
    								a += '<div class="col">';
  									a += '<button type="button" class="btn btn-primary btn-sm .modal-param" data-toggle="modal" data-target="#modal" data-unique="' + value.dayLessonNo + '"' +  'onclick="setModal(' + value.dayLessonNo + ')">상세보기 </button>';
  									a += '</div>';
  									a += '</div>';
  									a += '</div>';
                    a += '</div>';
  
                    $(".dayLessonList").append(a);
  
                    thisNode = document.getElementById('dayLessonNo_'+value.dayLessonNo);
                    thisNode.setAttribute('value', value.dayLessonNo);
                    thisNode = document.getElementById('lessonSummary_'+value.dayLessonNo);
                    thisNode.innerHTML = value.lessonSummary;
                    thisNode = document.getElementById('lessonEvaluation_'+value.dayLessonNo);
                    thisNode.setAttribute('value', value.lessonEvaluation);
  
                  });
  
        }
    });
  }
  
  // 일별 과외 진행현황 추가
    function dayLessonInsert(insertData) {
  	$.ajax({
			url : 'dayLesson/add',
			type : 'post',
			data : insertData,
			success : function(data) {
				if (data == 1) {
					location.href = "list?lessonNo=" + lessonNo;
				}
			}
		});
	}

	// 일별 과외 진행현황 수정
	function dayLessonUpdate() {
		var dayLessonNo = $("#modalDayLessonNo").val();
		var updateLessonDate = $("#modalLessonDate").val();
		var updateLessonStartHour = $("#modalLessonStartHour").val();
		var updateLessonEndHour = $("#modalLessonEndHour").val();
		var updateLessonSummary = $("#modalLessonSummary").val();
		var updateLessonEvaluation = $("#modalLessonEvaluation").val();

		swal({
        title: "수정",
        text: "수정하시겠습니까?",
        buttons: true,
      })
      .then((willDelete) => {
        if (willDelete) {
          swal("수정되었습니다.", {
            icon: "success",
          });
          $.ajax({
	    			url : 'dayLesson/update',
	    			type : 'post',
	    			data : {
	    				'dayLessonNo' : dayLessonNo,
	    				'lessonDate' : updateLessonDate,
	    				'lessonStartHour' : updateLessonStartHour,
	    				'lessonEndHour' : updateLessonEndHour,
	    				'lessonSummary' : updateLessonSummary,
	    				'lessonEvaluation' : updateLessonEvaluation
	    			},
	    			success : function(data) {
	    				if (data == 1)
	    					location.href = "list?lessonNo=" + lessonNo;
	    			}
	    		});
        } else {
        }
      });
	}
	
	// 일별 과외 진행현황 삭제
  function dayLessonDelete() {
  	var dayLessonNo = $("#modalDayLessonNo").val();
  	swal({
          title: "삭제",
          text: "삭제하시겠습니까?",
          buttons: true,
        })
        .then((willDelete) => {
          if (willDelete) {
            swal("삭제되었습니다.", {
              icon: "success",
            });
            $.ajax({
                url : 'dayLesson/delete/',
                type : 'post',
                data : {
            			'dayLessonNo' : dayLessonNo,
            			'lessonNo' : lessonNo
            		},
                success : function(data) {
                  if (data == 1)
                	  location.href = "list?lessonNo=" + lessonNo;
                }
              });
          } else {
          }
        });
  }

	$(document).ready(function() {
		//modalLessonDate.max = new Date().toISOString().split("T")[0]; // 오늘 날짜
		dayLessonList();
		if (${loginUser.memberTypeNo == 1 && lessonState == 5 && teacherReview == null} ) {
			swal({
          title: "후기작성",
  	      text: "다른 학생들에게 이 선생님에 대해 알려주세요!",
          buttons: true,
        })
        .then((willDelete) => {
          if (willDelete) {
        	  location.href = "reviewForm?lessonNo=" + lessonNo;
          } else {
        	  location.href = "../lesson/list";
          }
        });
		}
	});
</script>

<script>
  // 일별 과외 추가 버튼 눌렀을 때 modal 설정
	function resetModal() {
		var addButton = document.querySelector('#btnAdd');
		addButton.style.display = 'inline';
		var updateButton = document.querySelector('#btnUpdate');
		updateButton.style.display = 'none';
		var addButton = document.querySelector('#btnDelete');
		addButton.style.display = 'none';
		
    $("#modalDayLessonNo").val('');
    $("#modalLessonDate").val('');
    $("#modalLessonSummary").val('');
    $("#modalLessonEvaluation").val('');
  }
  
	// 일별 과외 상세보기 버튼 눌렀을 때 modal 설정
	function setModal(key) {
		if (${loginUser.memberTypeNo == 3 && lessonState == 1}) {
			var addButton = document.querySelector('#btnAdd');
			addButton.style.display = 'none';
			var updateButton = document.querySelector('#btnUpdate');
			updateButton.style.display = 'inline';
			var addButton = document.querySelector('#btnDelete');
			addButton.style.display = 'inline';
		} else if (${lessonState == 7 || loginUser.memberTypeNo == 1 || loginUser.memberTypeNo == 2 || 
			(loginUser.memberTypeNo == 3 && (lessonState == 3 || lessonState == 5 || lessonState == 7))}) {
  			var sdt = document.querySelector('#modalLessonDate');
  			sdt.readOnly = true;
  			var sh = document.querySelector('#modalLessonStartHour');
  			sh.readOnly = true;
        var eh = document.querySelector('#modalLessonEndHour');
        eh.readOnly = true;
        var summary = document.querySelector('#modalLessonSummary');
        summary.readOnly = true;
        var ev = document.querySelector('#modalLessonEvaluation');
        ev.readOnly = true;
    }
		
	  var daylessonNo = $("#dayLessonNo_" + key).val();
	  $("#modalDayLessonNo").val(daylessonNo);
	    
	  var lessonDate = $("#lessonDate_" + key).text();
	  console.log("modal==> " + lessonDate);
	  $("#modalLessonDate").val(lessonDate);
	    
    var lessonStartHour = $("#lessonStartHour_" + key).text();
    $("#modalLessonStartHour").val(lessonStartHour);
    
    var lessonEndHour = $("#lessonEndHour_" + key).text();
    $("#modalLessonEndHour").val(lessonEndHour);
    
    var lessonSummary = $("#lessonSummary_" + key).text();
    $("#modalLessonSummary").val(lessonSummary);
    
    var lessonEvaluation = $("#lessonEvaluation_" + key).val();
    $("#modalLessonEvaluation").val(lessonEvaluation);
  }
</script>

