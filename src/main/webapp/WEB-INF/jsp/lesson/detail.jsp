<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
  #lesson-description {
    border: 0.5px solid #d2d2d2;
    border-radius: .25rem;
    background-image: linear-gradient(to top, #9c27b0 2px, rgba(156, 39, 176, 0) 2px),
      linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);
  }
</style>

<div class="page-header header-filter" data-parallax="true" style="background-image: url('/assets/img/lesson/bg4.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>커리큘럼</h1>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="main main-raised">
  <div class="container pt-5 pb-4" style="padding-left: 45px; padding-right: 45px;">
    <div id='content'>
      <div class="row">
        <div class="col">
          <h4>과외번호: ${lesson.lessonNo}</h4>
        </div>
        <div class="col text-right">
          <form name="deleteAll" action='deleteAll' method='post'>
            <input type="hidden" name="lessonNo" value="${lesson.lessonNo}">
            <button id="deleteCurrBtn" type="button" class="btn btn-danger deleteCurrBtn"
            >커리큘럼 삭제</button>
          </form>
        </div>
      </div>
      
      <form id="form1" name="frm1" action='update' method='post'>
          <div class="row">
            <div class="col-lg-3 col-sm-4">
              <label for="basic-url1">시작일</label>
              <div class="form-group has-default bmd-form-group pt-0">
                <input name="sdt" id="basic-url1" type="date" class="form-control" placeholder="Regular"
                  value="${lesson.startDate}">
              </div>
            </div>
            <div class="col-lg-3 col-sm-4">
              <label for="basic-url2">종료일</label>
              <div class="form-group has-default bmd-form-group pt-0">
                <input name="edt" id="basic-url2" type="date" class="form-control" placeholder="Regular"
                  value="${lesson.endDate}">
              </div>
            </div>
            <div class="col-lg-3 col-sm-4">
              <label for="basic-url3">시작 시간</label>
              <div class="form-group has-default bmd-form-group pt-0">
                <input name="st" id="basic-url3" type="time" class="form-control" placeholder="Regular"
                  value="${lesson.curriculum.curriculumLessonStartTime}">
              </div>
            </div>
            <div class="col-lg-3 col-sm-4">
              <label for="basic-url4">종료 시간</label>
              <div class="form-group has-default bmd-form-group pt-0">
                <input name="et" id="basic-url4" type="time" class="form-control" placeholder="Regular"
                  value="${lesson.curriculum.curriculumLessonEndTime}">
              </div>
            </div>
          </div>

          <label for="basic-url5">요일</label>
          <div class="pb-3" id="basic-url5">
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id='OPTI_1' name='weekArr' value="1"> 일
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id='OPTI_2' name='weekArr' value="2"> 월
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id='OPTI_3' name='weekArr' value="3"> 화
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id='OPTI_4' name='weekArr' value="4"> 수
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id='OPTI_5' name='weekArr' value="5"> 목
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id='OPTI_6' name='weekArr' value="6"> 금
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" id='OPTI_7' name='weekArr' value="7"> 토
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="chk" onclick="javascript:checking()">전체선택
                <span class="form-check-sign">
                  <span class="check"></span>
                </span>
              </label>
            </div>
          </div>

          <div class="row">
            <div class="col-lg-4 col-sm-6">
              <input name="schoolType" type="hidden" class="form-control" value="${lesson.subject.schoolTypeNo}">
              <label for="basic-url2">학교</label>
              <div class="form-group has-default bmd-form-group pt-0">
                <select id="scT" class="custom-select" name="schoolTypeNo" disabled="disabled">
                  <option value="">학교 선택</option>
                  <option id="1" value=1>초등학교</option>
                  <option id="2" value=2>중학교</option>
                  <option id="3" value=3>고등학교</option>
                </select>
              </div>
            </div>
            <div class="col-lg-4 col-sm-6">
              <label for="basic-url2">과목</label>
              <input name="subjectNameVal" type="hidden" class="form-control" value="${lesson.subject.subjectName}">
              <div class="form-group has-default bmd-form-group pt-0">
                <select id="subNameT" class="custom-select" name="subjectName" disabled="disabled">
                  <option value="">과목 선택</option>
                  <option id="korean1" value="국어">국어</option>
                  <option id="english1" value="영어">영어</option>
                  <option id="math1" value="수학">수학</option>
                </select>
              </div> 
            </div>
            <div class="col-lg-4 col-sm-6">
              <label for="basic-url2">과외비</label>
              <div class="form-group has-default bmd-form-group pt-0">
                <div class="d-flex">
                  <div class="flex-item" style="flex-basis: 95%;">
                    <input id="lesson-fee" name=lessonFee type="text" class="form-control pl-2"
                      value="${lesson.lessonFee}" readonly>
                  </div>
                  <div class="flex-item align-self-center pl-1" style="flex-basis: 5%;">
                    <span>원</span>
                  </div>
                </div>
              </div>
            </div>
          </div>

        <div class="form-group">
          <label for="lesson-description">과외 설명</label>
          <textarea class="form-control pl-2" id="lesson-description" name="lessonDescription" rows="3">${lesson.lessonDescription}
          </textarea> 
        </div>

          <table id="table" class='table table-hover'>
            <thead>
              <tr>
                <th>과외 내용</th>
                <th>소요일</th>
              </tr>
            </thead>
            <tbody id="lesson-table">
              <c:forEach items="${lesson.clcs}" var="clc">
                <tr id="${clc.curriculumLessonNo}">
                  <input id="rowno" type="hidden" name="curriculumLessonNo" value="${clc.curriculumLessonNo}">
                  <th scope="row">
                    <input name="lessonconts" type="text" class="form-control" value="${clc.lessonContents}"></th>
                  <td>
                    <div class="input-group mb-3">
                      <input name="lessondays" type="text" class="form-control" value="${clc.lessonDays}">
                      <div class="input-group-append">
                        <span class="input-group-text" id="basic-addon2">일</span>
                      </div>
                      <input id="${clc.curriculumLessonNo}" type="button"
                        class="btn btn-outline-primary btn-sm lessonConts-delete-button" value="삭제"
                        onclick="deleteRow(this)">
                    </div>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          
          <div class="row">
            <div class="col text-center">
              <input type="button" class="btn btn-outline-primary btn-sm lessonConts-add-button" value="+">
            </div>
          </div>

          <div class="row">
            <div class="col text-right" style="padding-right: 9px;">
              <button type="button" id="changeBtn" class="btn btn-primary">변경</button>
              <a href="list" class="btn btn-primary">목록</a>
            </div>
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
    html += '<th scope="row">';
    html += '<span class="bmd-form-group is-filled">';
    html += '<input name="lessonconts" type="text" class="form-control"></td>';
    html += '<td>';
    html += '<span class="bmd-form-group is-filled"><div class="input-group mb-3">';
    html += '<input name="lessondays" type="text" class="form-control">';
    html += '<div class="input-group-append">';
    html += '<span class="input-group-text" id="basic-addon2">일</span>';
    html += '</div>';
    html += '<input type="button" class="btn btn-outline-primary btn-sm lessonConts-delete-button" value="삭제" onclick = "deleteRow(this)">';
    html += '</div>';
    html += '</span>';
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
      var row = btn.parentNode.parentNode.parentNode.parentNode;
      
      console.log(row);

      let hiddenLessonNoHtml = '';
      hiddenLessonNoHtml += '<input type="hidden" name="deletedCurriculumLessonNo" value="' + row.getAttribute('id') + '">';
      $('form').prepend(hiddenLessonNoHtml);

      if ($('tbody > tr').length == 1) {
        return;
      }
      
      var tr = row.getAttribute('id');
      
      row.parentNode.removeChild(row);  
    }
  </script>

  <script>
    let lessonDeleteAllBtn = document.getElementsByClassName('deleteCurrBtn')[0];
    lessonDeleteAllBtn.addEventListener('click', () => {
       
       
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
           document.deleteAll.submit();
         } else {
         }
       });
    }); 
  </script> 
  
<!--   <script>
  $('#deleteCurrBtn').on('click',function(e){
    e.preventDefault();
    var form = $(this).parents('form');
    swal({
      title: "삭제",
      text: "정말삭제하시겠습니까?",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#DD6B55",
      confirmButtonText: "삭제",
      closeOnConfirm: false
    }, function(isConfirm){
        if (isConfirm) form.submit();
    });
  });
  
  </script> -->
  

  <script>
    $('#changeBtn').click(function (e) {
      e.preventDefault();
      
      console.log("11");
      var lessonSdt = $('input[name=sdt]').val().replace(/(\s*)/g, "");
      var lessonEdt = $('input[name=edt]').val().replace(/(\s*)/g, "");
      var lessonSt = $('input[name=st]').val().replace(/(\s*)/g, "");
      var lessonEt = $('input[name=et]').val().replace(/(\s*)/g, "");
      
      var lessonWeekArr = $('input[name=weekArr]');
      var lessonConts = $('input[name=lessonconts]');
      var lessonDays = $('input[name=lessondays]');
      
//       var lessonWeekArr = $('input[name=weekArr]').val().replace(/(\s*)/g, "");
//       var lessonConts = $('input[name=lessonconts]').val().replace(/(\s*)/g, "");
//       var lessonDays = $('input[name=lessondays]').val().replace(/(\s*)/g, "");
      console.log(lessonWeekArr);
      console.log(lessonConts);
      console.log(lessonDays);
      
      let weekCount=0;
      for (let lessonWeek of lessonWeekArr) {
        if (lessonWeek.checked == true)
          weekCount++;
      }
      if (weekCount == 0) {
        swal("모두 입력하세요.");
        return;
      }
        
      console.log(lessonConts.length);
      for (let i = 0; i < lessonConts.length; i++) {
        if (lessonConts[i].value == '' || lessonDays[i].value == '') {
          swal("모두 입력하세요.");
          return;
        }
      }
      
      if (lessonSdt.length > 0 &&
        lessonEdt.length > 0 &&
        lessonSt.length > 0 &&
        lessonEt.length > 0) {
        document.getElementById("form1").submit();
      } else {
        swal("모두 입력하세요.");
      }
    });
  </script>

  <script>
    let sc = $('input[name=schoolType]').val();
    if (sc == 1) {
      console.log("1이구연");
      $('select[id=scT]').val(1);
    } else if (sc == 2) {
      console.log("2이구연");
      $("2").attr("selected", "selected");
      $('select[id=scT]').val(2);
    } else if (sc == 3) {
      console.log("3이구연");
      $("3").attr("selected", "selected");
      $('select[id=scT]').val(3);
    } 
  </script>

  <script>
    let subName = $('input[name=subjectNameVal]').val();
    if (subName == "국어") {
      console.log("라라라 국어");
      $("korean1").attr("selected", "selected");
      $('select[id=subNameT]').val("국어");
    } else if (subName == "영어") {
      console.log("라라라 영어");
      $("english1").attr("selected", "selected");
      $('select[id=subNameT]').val("영어");
    } else if (subName == "수학") {
      console.log("라라라 수학");
      $("math1").attr("selected", "selected");
      $('select[id=subNameT]').val("수학");
    } 
  </script>