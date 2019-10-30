<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 리스트</title>
</head>
<body>
<h1>수업 리스트</h1>
<c:forEach items="${lessons}" var="lesson">
  <tr>
    <td>수업번호: ${lesson.lessonNo}<br></td>
    
    <c:choose>
    <c:when test="${lesson.member.name eq NULL}"> <td>이름: 미정<br></td> </c:when>
    <c:otherwise> <td>이름: ${lesson.member.name}<br></td> </c:otherwise>
    </c:choose>
    
<%--     <td>이름: ${lesson.member.name}<br></td> --%>
    <td>수업과목: ${lesson.subjectName}<br></td>
    <td>시작일: ${lesson.startDate}&ensp;종료일: ${lesson.endDate}<br></td>
  </tr>
  <br>
</c:forEach> 

</body>
</html>
