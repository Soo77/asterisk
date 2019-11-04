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

<c:set var="i" value="0"/>
<c:forEach items="${lessons}" var="lesson">
<c:if test="${i == 0}">
수업시작일: ${lesson.startDate} 수업종료일: ${lesson.endDate} 수업요일/시간: <br>
</c:if>
<c:set var="i" value="${i + 1}"/>
</c:forEach>

<c:forEach items="${lessons}" var="lesson">
<div>
<%-- <td>번호: ${lesson.clc.curriculumLessonNo}<br></td> 
<td>수업번호: ${lesson.clc.curriculumNo}<br></td>  --%>


내용: ${lesson.clc.lessonContents}&ensp;
수업일: ${lesson.clc.lessonDays}<br> 
</div>
</c:forEach>

</body>
</html>  