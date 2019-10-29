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
    <td>수업번호; ${lesson.lessonNo}<br></td>
<%--     <td><a href='detail?no=${lesson.no}'>${lesson.title}</a></td> --%>
    <td>회원이름; ${lesson.member.name}<br></td>
    <td>수업과목; ${lesson.subjectName}<br></td>
    <td>날짜; ${lesson.startDate} ~ ${lesson.endDate}<br></td>
  </tr>
  
</c:forEach> 

</body>
</html>