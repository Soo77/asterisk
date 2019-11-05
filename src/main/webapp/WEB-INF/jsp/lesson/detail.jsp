<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 내용</title>
</head>
<body>
<h1>수업내용</h1>

<form action='update' method='post'>
수업시작일: ${lesson.startDate}&ensp; 수업종료일: ${lesson.endDate}&ensp;
수업요일: ${lesson.curriculum.curriculumLessonDay}
시간: ${lesson.curriculum.curriculumLessonStartTime} ~ ${lesson.curriculum.curriculumLessonEndTime} <br>
<table class="table table-hover" >
  <thead>
    <tr>
      <th scope="col">수업 내용</th>
      <th scope="col">소요일</th>
    </tr>
  </thead>
  <tbody>
<c:forEach items="${lesson.clcs}" var="clc">
    <tr>
      <td>
      
        <div class="form-row">
          <div class="form-group col-md-6">
            <input type="hidden" name="curriculumLessonNo" value="${clc.curriculumLessonNo}">
            <input name="lessonconts" type="text" class="form-control" id="testinput1" value="${clc.lessonContents}">
          </div>
        </div> 
      </td>
      <td class="d-inline-flex">
        <div class="input-group mb-3">
          <input name="lessondays" type="text" class="form-control" id="testinput2" value="${clc.lessonDays}">
          <div class="input-group-append">
            <span class="input-group-text" id="basic-addon2">일</span>
          </div>
        </div>
        <%-- <div class="form-group col-md-4">
          <input name="lessondays" type="text" class="form-control" id="testinput2" value="${clc.lessonDays}">일
        </div> --%>
<!--         <div class="form-group col-md-2"> -->
<!--           일 -->
<!--         </div> -->
      </td>
    </tr>
</c:forEach>
  </tbody>
</table>

<c:set var="garo" value="${lesson.lessonNo}" scope="session"></c:set>

<button>변경</button>
</form>
</body>
</html>  