<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"
  charset="UTF-8"> </script>
<head>
</head>


<div class="page-header header-filter" data-parallax="true" style="background-image: url('assets/img/bg3.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>수업내용</h1>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised">
  <div class="container pt-5 pb-4" style="padding-left: 45px; padding-right: 45px;">
    <div id='content'>
    <div class="text-right mb-4">
    
     <form name="deleteAll" action='deleteAll' method='post'>
      <input type="hidden" name="lessonNo" value="${lesson.lessonNo}">
      <input type="hidden" class="btn btn-danger deleteCurrBtn" value="커리큘럼 삭제"> 
     </form> 

    </div> 
      <form action='update' method='post'>
      <div style="padding-left: 13px; padding-right: 13px;">
        <div class="row">
          <div class="col-lg-3 col-sm-4">
            <label for="basic-url1">수업시작일</label>
            <div class="form-group has-default bmd-form-group pt-0">
              <input name="sdt" id="basic-url1" type="date" class="form-control" placeholder="Regular"
                value="${lesson.startDate}" readonly>
            </div>
          </div>
          <div class="col-lg-3 col-sm-4">
            <label for="basic-url2">수업종료일</label>
            <div class="form-group has-default bmd-form-group pt-0">
              <input name="edt" id="basic-url2" type="date" class="form-control" placeholder="Regular"
                value="${lesson.endDate}"readonly>
            </div>
          </div>
          <div class="col-lg-3 col-sm-4">
            <label for="basic-url3">수업시작시간</label>
            <div class="form-group has-default bmd-form-group pt-0">
              <input name="st" id="basic-url3" type="time" class="form-control" placeholder="Regular"
                value="${lesson.curriculum.curriculumLessonStartTime}"readonly>
            </div>
          </div>
          <div class="col-lg-3 col-sm-4">
            <label for="basic-url4">수업종료시간</label>
            <div class="form-group has-default bmd-form-group pt-0">
              <input name="et" id="basic-url4" type="time" class="form-control" placeholder="Regular"
                value="${lesson.curriculum.curriculumLessonEndTime}"readonly>
            </div>
          </div>
        </div>


        <label for="basic-url5">수업요일</label>
        <div class="pb-5" id="basic-url5">
          <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" type="checkbox" id='OPTI_1' name='weekArr' value="1" onclick="return false;"> 일
              <span class="form-check-sign">
                <span class="check"></span>
              </span>
            </label>
          </div>
          <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" type="checkbox" id='OPTI_2' name='weekArr' value="2"  onclick="return false;"> 월 
              <span class="form-check-sign">
                <span class="check"></span>
              </span>
            </label>
          </div>
          <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" type="checkbox" id='OPTI_3' name='weekArr' value="3" onclick="return false;"> 화
              <span class="form-check-sign">
                <span class="check"></span>
              </span>
            </label>
          </div>
          <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" type="checkbox" id='OPTI_4' name='weekArr' value="4" onclick="return false;"> 수
              <span class="form-check-sign">
                <span class="check"></span>
              </span>
            </label>
          </div>
          <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" type="checkbox" id='OPTI_5' name='weekArr' value="5" onclick="return false;"> 목
              <span class="form-check-sign">
                <span class="check"></span>
              </span>
            </label>
          </div>
          <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" type="checkbox" id='OPTI_6' name='weekArr' value="6" onclick="return false;"> 금
              <span class="form-check-sign">
                <span class="check"></span>
              </span>
            </label>
          </div>
          <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" type="checkbox" id='OPTI_7' name='weekArr' value="7" onclick="return false;"> 토
              <span class="form-check-sign">
                <span class="check"></span>
              </span>
            </label>
          </div>
          <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" type="checkbox" name="chk" onclick="javascript:checking()" onclick="return false;">전체선택
              <span class="form-check-sign">
                <span class="check"></span>
              </span>
            </label>
          </div>
        </div>
</div>
        <table id="table" class='table table-hover'>
          <thead>
            <tr>
              <th>수업 내용</th>
              <th>소요일</th>
            </tr>
          </thead>
          <tbody id="lesson-table">
            <c:forEach items="${lesson.clcs}" var="clc">
              <tr id="${clc.curriculumLessonNo}">
                <input id="rowno" type="hidden" name="curriculumLessonNo" value="${clc.curriculumLessonNo}">
                <th scope="row">
                <input name="lessonconts" type="text" class="form-control" value="${clc.lessonContents}"readonly></th>
                <td> 
                  <div class="input-group mb-3">
                    <input name="lessondays" type="text" class="form-control" value="${clc.lessonDays}"readonly>
                    <div class="input-group-append">
                      <span class="input-group-text" id="basic-addon2">일</span>
                    </div>
                      <input id="${clc.curriculumLessonNo}" type="hidden" class="btn btn-rose btn-sm lessonConts-delete-button" value="삭제" onclick = "deleteRow(this)">
                  </div>
                </td>
              </tr>
            </c:forEach>
          </tbody> 
        </table> 

        <div class="text-right">
          <input type="hidden" class="btn btn-primary lessonConts-add-button" value="추가">  
          <input type="hidden" class="btn btn-primary" value="변경">
        </div>
      </form>
    </div>

    <c:set var="garo" value="${lesson.lessonNo}" scope="session"></c:set>


  </div>
</div>



<script language="javascript">
  function checking() {
    if (document.all['chk'].checked == true) {
      for (i = 1; i < 8; i++) {
        document.all['OPTI_' + i].checked = true;
      }
    } else if (document.all['chk'].checked == false) {
      for (i = 1; i < 8; i++) {
        document.all['OPTI_' + i].checked = false;
      }
    }
    return;
  }
</script>

<script>
  let day = '${lesson.curriculum.curriculumLessonDay}';
  console.log(day);
  let array = day.split("");
  for (var i = 0; i < array.length; i++) {
    console.log(array[i]);
    if (array[i] == 1) {
      console.log('test');
      $("input:checkbox[id='OPTI_" + (i + 1) + "']").prop("checked", true);
    }
  }   
</script>

<script>
  let html = '';
  html += '<tr>';
  html += '<input type="hidden" name="curriculumLessonNo" value="0">';
  html += '<td scope="row">';
  html += '<div>';
  html += '<input name="lessonconts" type="text" class="form-control"></td>';
  html += '<td>';
  html += '<div class="input-group mb-3">';
  html += '<input name="lessondays" type="text" class="form-control">';
  html += '<div class="input-group-append">';
  html += '<span class="input-group-text" id="basic-addon2">일</span>'; 
  html += '</div>';
  html += '<input type="button" class="btn btn-rose btn-sm lessonConts-delete-button" value="삭제" onclick = "deleteRow(this)">';
  html += '</div>'; 
  html += '</div>'; 
  html += '</td>';
  html += '</tr>'; 

  let lessonContsAddButton = document.getElementsByClassName('lessonConts-add-button')[0];

  lessonContsAddButton.addEventListener('click', () => {
    $('#lesson-table').append(html);

  });
</script>
 

<!-- 테이블의 열 삭제하려고 -->
<script>
  let deletedCurriculumNoList = new Array();
  
function deleteRow(btn) {
  var row = btn.parentNode.parentNode.parentNode;
  console.log(row);

  let hiddenLessonNoHtml = '';
  hiddenLessonNoHtml += '<input type="hidden" name="deletedCurriculumLessonNo" value="'+row.getAttribute('id')+'">';
  $('form').prepend(hiddenLessonNoHtml);
  
  if ($('tbody > tr').length == 1) {
    return; 
  }
  row.parentNode.removeChild(row);
}
</script> 
 
<script>
  let lessonDeleteAllBtn = document.getElementsByClassName('deleteCurrBtn')[0];
  lessonDeleteAllBtn.addEventListener('click', () => {
    if (confirm("정말 삭제하시겠습니까??") == true){    //확인
      document.deleteAll.submit();
    }else{   
      return;
    }
  }); 
</script>