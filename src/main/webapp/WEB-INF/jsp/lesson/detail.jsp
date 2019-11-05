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

수업시작일: ${lesson.startDate}&ensp; 수업종료일: ${lesson.endDate}&ensp;
수업요일: ${lesson.curriculum.currentLessonDay}
시간: ${lesson.curriculum.currentLessonStartTime} ~ ${lesson.curriculum.currentLessonEndTime} <br>
<c:forEach items="${lesson.clcs}" var="clc">
<form>
  <div class="form-row">
    <div class="form-group col-md-4">
      <input type="text" class="form-control" id="testinput1" value="${clc.lessonContents}">
    </div>
    <div class="form-group col-md-1">
      <input type="text" class="form-control" id="testinput2" value="${clc.lessonDays}">
    </div>
  </div> 
</form>

</c:forEach>
</body>
</html>  