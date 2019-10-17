<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>게시물 목록</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>

<div id='content'>
<h1>질문게시판</h1>

<table class='table table-hover'>
<tr>
  <th>번호</th>
  <th>제목</th>
  <th>이름</th>
  <th>조회</th>
</tr>

<c:forEach items="${boards}" var="board">
  <tr>
    <td>${board.no}</td>
    <td><a href='detail?no=${board.no}'>${board.title}</a></td>
    <td>${board.member.name}</td>
    <td>${board.viewCount}</td>
  </tr>
</c:forEach>
</table>
<a href='form'>글쓰기</a><br>
</div>


</body></html>

