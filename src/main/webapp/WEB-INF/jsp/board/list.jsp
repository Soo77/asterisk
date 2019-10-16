<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판연습</title>
</head>
<body>

<table class='table table-hover'>
<a href="form">새글</a>
<tr>
  <th>번호</th>
  <th>내용</th>
</tr>
<c:forEach items="${boards}" var="board">
  <tr>
    <td>${board.no}</td>
    <td><a href='detail?no=${board.no}'>${board.contents}</a></td>
  </tr>
</c:forEach>  
</table>

</body>
</html>