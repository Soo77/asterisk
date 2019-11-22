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
        <input type="hidden" class="btn btn-danger deleteCurrBtn" value="커리큘럼 삭제"> 
       </form> 
      </div>
    </div>
    
      <form action='update' method='post'>
        <div class="row">
          <div class="col-lg-3 col-sm-4">
            <label for="basic-url1">시작일</label>
            <div class="form-group has-default bmd-form-group pt-0">
              <input name="sdt" id="basic-url1" type="date" class="form-control pl-2" placeholder="Regular"
                value="${lesson.startDate}" readonly>
            </div>
          </div>
          <div class="col-lg-3 col-sm-4">
            <label for="basic-url2">종료일</label>
            <div class="form-group has-default bmd-form-group pt-0">
              <input name="edt" id="basic-url2" type="date" class="form-control pl-2" placeholder="Regular"
                value="${lesson.endDate}"readonly>
            </div>
          </div>
          <div class="col-lg-3 col-sm-4">
            <label for="basic-url3">시작 시간</label>
            <div class="form-group has-default bmd-form-group pt-0">
              <input name="st" id="basic-url3" type="time" class="form-control pl-2" placeholder="Regular"
                value="${lesson.curriculum.curriculumLessonStartTime}"readonly>
            </div>
          </div>
          <div class="col-lg-3 col-sm-4">
            <label for="basic-url4">종료 시간</label>
            <div class="form-group has-default bmd-form-group pt-0">
              <input name="et" id="basic-url4" type="time" class="form-control pl-2" placeholder="Regular"
                value="${lesson.curriculum.curriculumLessonEndTime}"readonly>
            </div>
          </div>
        </div>


        <label for="basic-url5">요일</label>
        <div class="pb-3" id="basic-url5">
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
        </div>
    
     
      <div class="row">  
          <div class="col-lg-4 ">
            <label for="basic-url2">학교</label>
            
            <c:choose>
              <c:when test="${lesson.subject.schoolTypeNo eq 1}">
                <div class="form-group has-default bmd-form-group pt-0">
                  <input name="schoolType" type="text" class="form-control pl-2"
                    value="초등"readonly> 
                </div>
              </c:when>
              <c:when test="${lesson.subject.schoolTypeNo eq 2}">
                <div class="form-group has-default bmd-form-group pt-0">
                  <input name="schoolType" type="text" class="form-control pl-2"
                    value="중등"readonly> 
                </div>
              </c:when>
              <c:when test="${lesson.subject.schoolTypeNo eq 3}">
                <div class="form-group has-default bmd-form-group pt-0">
                  <input name="schoolType" type="text" class="form-control pl-2"
                    value="고등"readonly> 
                </div>
              </c:when>
            </c:choose>
          </div>
          <div class="col-lg-4">
            <label for="basic-url2">과목</label>
            <div class="form-group has-default bmd-form-group pt-0">
              <input name="subjectName" type="text" class="form-control pl-2"
                value="${lesson.subject.subjectName}"readonly>
            </div>
          </div>
            <div class="col-lg-4">
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
         
         <div class="form-group bmd-form-group is-filled" style="padding-right: 17px;">
          <label for="lesson-description">과외 설명</label>
          <textarea class="form-control pl-2" id="lesson-description" name="lessonDescription" rows="3" readonly>${lesson.lessonDescription}
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
                <input name="lessonconts" type="text" class="form-control pl-2" value="${clc.lessonContents}"readonly></th>
                <td> 
                  <div class="input-group mb-3">
                    <input name="lessondays" type="text" class="form-control pl-2" value="${clc.lessonDays}"readonly>
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
        <div class="row">
          <div class="col text-right"> 
            <c:if test="${(loginUser.memberTypeNo eq 1 or loginUser.memberTypeNo eq 2) and lesson.lessonState eq 2}">
              <input type="button" class="btn btn-primary pay-button" value="결제" onClick="location.href='../payment/detail'">
            </c:if>
            <a href="list" class="btn btn-primary">목록</a>
          </div>
        </div>
      </form> 
    </div>

    <c:set var="garo" value="${lesson.lessonNo}" scope="session"></c:set>
    <c:set var="lessonFee" value="${lesson.lessonFee}" scope="session"></c:set>

  </div>
</div> 

<!-- 1,000 단위마다 콤마 찍는 함수 -->
<script src="/js/payment/number-formatter.js"></script>
<script>
  let myLessonFee = numberFormat(${lesson.lessonFee});
  document.getElementById('lesson-fee').value = myLessonFee;
</script>

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