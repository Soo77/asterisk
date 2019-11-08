<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript" charset="UTF-8"> </script>

<script language="javascript">
function checking(){
if(document.all['chk'].checked == true)
{
for(i=1; i<8;i++){
document.all['OPTI_'+i].checked = true;
}
}
else if(document.all['chk'].checked == false)
{
for(i=1; i<8;i++){
document.all['OPTI_'+i].checked = false;
}
}
return;
}
</script>



<head>

</head>


  <div class="page-header header-filter" data-parallax="true" style="background-image: url('assets/img/bg3.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand text-center">
            <h1>새 커리큘럼 등록</h1>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="container pt-5 pb-4"> 
      
<div id='content'>
<!-- <h1 style="font-family: 'Nanum Gothic'; 
  margin-bottom: 20px;
">수업내용</h1> -->
<%-- 수업시작일: <input name="lessonconts" type="text" class="form-control" id="testinput1" value="${lesson.startDate}">
수업종료일: <input name="lessonconts" type="text" class="form-control" id="testinput1" value="${lesson.endDate}"> --%>

<%--     수업요일: ${lesson.curriculum.curriculumLessonDay} --%>
<form action='currAdd' method='post'>
    <div class="row">
      <div class="col-lg-3 col-sm-4">
        <label for="basic-url1">수업시작일</label>
        <div class="form-group has-default bmd-form-group pt-0">
          <input name="sdt" id="basic-url1" type="date" class="form-control" placeholder="Regular">
        </div>
      </div>
      <div class="col-lg-3 col-sm-4">
      <label for="basic-url2">수업종료일</label>
        <div class="form-group has-default bmd-form-group pt-0">
          <input name="edt" id="basic-url2" type="date" class="form-control" placeholder="Regular">
        </div>
      </div>
      <div class="col-lg-3 col-sm-4">
      <label for="basic-url3">수업시작시간</label>
        <div class="form-group has-default bmd-form-group pt-0">
          <input name="st" id="basic-url3" type="time" class="form-control" placeholder="Regular">
        </div>
      </div>
      <div class="col-lg-3 col-sm-4">
      <label for="basic-url4">수업종료시간</label>
        <div class="form-group has-default bmd-form-group pt-0"> 
          <input name="et" id="basic-url4" type="time" class="form-control" placeholder="Regular"> 
        </div>
      </div>
    </div> 
    
<!--     <label for="basic-url5">수업요일</label>
      -->

<label for="basic-url5">수업요일</label>
 <div class="pb-5" id="basic-url5">
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

<script>
    let day = '${lesson.curriculum.curriculumLessonDay}';
    console.log(day); 
    let array = day.split(""); 
    for (var i=0; i<array.length; i++){ 
      console.log(array[i]); 
      if (array[i]==1) { 
        console.log('test');
        $("input:checkbox[id='OPTI_"+(i+1)+"']").prop("checked", true);
      }  
    }   
</script> 

 
                
<table id="table" class='table table-hover'>
<thead>
<tr>
  <th>수업 내용</th>
  <th>소요일</th>
</tr>
</thead>
<tbody>
<c:forEach items="${lesson.clcs}" var="clc">
<input type="hidden" name="curriculumLessonNo">
    <tr>
      <th scope="row"><input name="lessonconts" type="text" class="form-control" id="testinput1"></th>
      <td>
        <div class="input-group mb-3">
          <input name="lessondays" type="text" class="form-control" id="testinput2">
          <div class="input-group-append">
            <span class="input-group-text" id="basic-addon2">일</span>
          </div>
        </div>
      </td>
    </tr>
</c:forEach>
</tbody>
</table>
<button class="btn btn-primary">등록</button>
</form>
</div>

<c:set var="garo" value="${lesson.lessonNo}" scope="session"></c:set>


<!--
<input type="button" id="add" class="btn btn-success" value="항목추가" />
 <script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#add').click(function(){
            $('#table').append('<tr><td>a</td><td>a</td></tr>');
        });
 
    $('#clear').click(function(){
            $('#table').empty();
        });
 
    });
</script> -->
    </div>
  </div>