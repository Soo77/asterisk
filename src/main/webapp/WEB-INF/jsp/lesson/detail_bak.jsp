<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 내용</title>
  <style>
    #content{
      margin-left: 0px; 
      margin-right: 500px;
    }
  </style>
</head>
<body>

<div id='content'>
<h1>수업내용</h1>

<%-- 수업시작일: <input name="lessonconts" type="text" class="form-control" id="testinput1" value="${lesson.startDate}">
수업종료일: <input name="lessonconts" type="text" class="form-control" id="testinput1" value="${lesson.endDate}"> --%>

<%--     수업요일: ${lesson.curriculum.curriculumLessonDay} --%>
<form action='update' method='post'>
    <div class="row">
      <div class="col-lg-3 col-sm-4">
        <label for="basic-url1">수업시작일</label>
        <div class="form-group has-default bmd-form-group">
          <input name="sdt" id="basic-url1" type="date" class="form-control" placeholder="Regular"
            value="${lesson.startDate}">
        </div>
      </div>
      <div class="col-lg-3 col-sm-4">
      <label for="basic-url2">수업종료일</label>
        <div class="form-group has-default bmd-form-group">
          <input name="edt" id="basic-url2" type="date" class="form-control" placeholder="Regular"
            value="${lesson.endDate}">
        </div>
      </div>
      <div class="col-lg-3 col-sm-4">
      <label for="basic-url3">수업시작시간</label>
        <div class="form-group has-default bmd-form-group">
          <input name="st" id="basic-url3" type="time" class="form-control" placeholder="Regular"
            value="${lesson.curriculum.curriculumLessonStartTime}">
        </div>
      </div>
      <div class="col-lg-3 col-sm-4">
      <label for="basic-url4">수업종료시간</label>
        <div class="form-group has-default bmd-form-group">
          <input name="et" id="basic-url4" type="time" class="form-control" placeholder="Regular"
            value="${lesson.curriculum.curriculumLessonEndTime}"> 
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
<tbody>
<c:forEach items="${lesson.clcs}" var="clc">
<input type="hidden" name="curriculumLessonNo" value="${clc.curriculumLessonNo}">
    <tr>
      <th scope="row"><input name="lessonconts" type="text" class="form-control" id="testinput1" value="${clc.lessonContents}"></th>
      <td>
        <div class="input-group mb-3">
          <input name="lessondays" type="text" class="form-control" id="testinput2" value="${clc.lessonDays}">
          <div class="input-group-append">
            <span class="input-group-text" id="basic-addon2">일</span>
          </div>
        </div>
      </td>
    </tr>
</c:forEach>
</tbody>
</table>
<button>변경</button>
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
</body>
</html>  