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
<h1>수업내용111</h1>

수업시작일: ${lesson.startDate}&ensp; 수업종료일: ${lesson.endDate}&ensp;
수업요일: ${lesson.curriculum.currentLessonDay}c
시간: ${lesson.curriculum.currentLessonStartTime} ~ ${lesson.curriculum.currentLessonEndTime} <br>
<c:forEach items="${lesson.clcs}" var="clc">

<div>
내용: ${clc.lessonContents}&ensp;
수업일: ${clc.lessonDays}<br> 
</div>
</c:forEach>
</body>
</html>  