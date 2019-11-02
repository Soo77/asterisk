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
<c:forEach items="${lessons}" var="lesson">
<div>
<td>번호: ${lesson.clc.curriculumLessonNo}<br></td> 
<td>수업번호: ${lesson.clc.curriculumNo}<br></td> 
<td>내용: ${lesson.clc.lessonContents}<br></td> 
<td>수업일: ${lesson.clc.lessonDays}<br></td> 
</div>
</c:forEach>

</body>
</html>  